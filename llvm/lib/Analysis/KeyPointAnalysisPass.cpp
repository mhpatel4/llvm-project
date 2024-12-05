#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Analysis/LoopInfo.h"
#include <unordered_set>

using namespace llvm;

PreservedAnalyses KeyPointAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeModule(M, MAM);
    return PreservedAnalyses::all();
}

void KeyPointAnalysisPass::analyzeModule(Module &M, ModuleAnalysisManager &MAM) {
    auto &FAM = MAM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();

    for (Function &F : M) {
        std::string funcName = F.getName().str();
        if (F.isDeclaration())
            continue;

        LoopInfo &LI = FAM.getResult<LoopAnalysis>(F);

        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                int line = -1;
                if (DILocation *Loc = I.getDebugLoc()) {
                    line = Loc->getLine();
                }

                if (BranchInst *brInst = dyn_cast<BranchInst>(&I)) {
                    if (brInst->isConditional()) {
                        std::string type = LI.isLoopHeader(&BB) ? "loop" : "branch";
                        if (type == "branch") {
                            if (!influencesRuntime(I, LI)) {
                                type = "non-critical";
                            }
                            // errs() << "Branch: " << influencesRuntime(I, LI) << " at Line: " << line <<"\n";
                        }
                        keyPoints.emplace_back(line, type, brInst, funcName);
                    }
                } else if (SwitchInst *swInst = dyn_cast<SwitchInst>(&I)) {
                    keyPoints.emplace_back(line, influencesRuntime(I, LI) ? "switch" : "non-critical", swInst, funcName);
                    // errs() << "Switch: " << influencesRuntime(I, LI) << " at Line: " << line <<"\n";
                } else if (CallInst *callInst = dyn_cast<CallInst>(&I)) {
                    if (!callInst->getCalledFunction()) {
                        // Analyze function pointer usage
                        bool influencesRuntime = analyzeFunctionPointerInfluence(M, MAM, callInst);
                        std::string type = influencesRuntime ? "func_ptr_call" : "non-critical";
                        keyPoints.emplace_back(line, type, callInst, funcName);
                    }
                }
            }
        }
    }
}

bool KeyPointAnalysisPass::influencesRuntime(Instruction &I, LoopInfo &LI) {
    // Updated list of I/O functions to include fopen and fclose
    auto isIOFunction = [](const StringRef &funcName) -> bool {
        static const std::unordered_set<std::string> ioFunctions = {
            "fread", "fwrite"
        };
        return ioFunctions.count(funcName.str()) > 0;
    };

    // Helper to check if a function has loops, function pointers, or I/O functions
    // Uses a visited set to prevent infinite recursion in case of recursive functions
    std::function<bool(Function*, std::unordered_set<Function*> &)> hasInfluentialInstructions =
        [&](Function *F, std::unordered_set<Function*> &visited) -> bool {
            if (!F || visited.count(F))
                return false;

            visited.insert(F);

            // Simple loop detection by checking for back edges
            bool hasLoop = false;
            std::vector<BasicBlock*> blocks;
            for (BasicBlock &BB : *F)
                blocks.push_back(&BB);

            for (unsigned i = 0; i < blocks.size(); ++i) {
                BasicBlock *BB = blocks[i];
                for (Instruction &Inst : *BB) {
                    if (auto *brInst = dyn_cast<BranchInst>(&Inst)) {
                        if (brInst->isConditional() || brInst->isUnconditional()) {
                            for (unsigned j = 0; j < brInst->getNumSuccessors(); ++j) {
                                BasicBlock *succ = brInst->getSuccessor(j);
                                auto it = std::find(blocks.begin(), blocks.end(), succ);
                                if (it != blocks.end() && (std::distance(blocks.begin(), it) < (int)i)) {
                                    hasLoop = true;
                                    break;
                                }
                            }
                        }
                    }
                    if (hasLoop)
                        break;
                }
                if (hasLoop)
                    break;
            }

            if (hasLoop)
                return true;

            // Check for I/O functions or function pointers in called functions
            for (BasicBlock &BB : *F) {
                for (Instruction &Inst : BB) {
                    if (auto *callInst = dyn_cast<CallInst>(&Inst)) {
                        Function *calledFunc = callInst->getCalledFunction();
                        if (!calledFunc)
                            return true; // Function pointer detected

                        if (isIOFunction(calledFunc->getName()))
                            return true; // I/O function detected

                        // Recursively check called functions
                        if (hasInfluentialInstructions(calledFunc, visited))
                            return true;
                    }
                }
            }

            return false;
        };

    // Check for branches
    if (BranchInst *brInst = dyn_cast<BranchInst>(&I)) {
        if (brInst->isConditional()) {
            BasicBlock *trueBlock = brInst->getSuccessor(0);
            BasicBlock *falseBlock = brInst->getSuccessor(1);

            // Check if successors are loop headers
            if (LI.isLoopHeader(trueBlock) || LI.isLoopHeader(falseBlock)) {
                return true; // Branch directly affects loop execution
            }

            // Check for further branches, function pointers, or I/O functions
            for (BasicBlock *successor : {trueBlock, falseBlock}) {
                for (Instruction &succInst : *successor) {
                    if (CallInst *callInst = dyn_cast<CallInst>(&succInst)) {
                        Function *calledFunc = callInst->getCalledFunction();
                        if (!calledFunc) {
                            return true; // Function pointer detected
                        }
                        if (isIOFunction(calledFunc->getName())) {
                            // errs() << calledFunc->getName();
                            return true; // I/O function detected
                        }
                        // Additionally, check if called function has loops or influential instructions
                        std::unordered_set<Function*> visited;
                        if (hasInfluentialInstructions(calledFunc, visited)) {
                            return true;
                        }
                    }
                }
            }
        }
    } 
    // Check for switches
    else if (SwitchInst *swInst = dyn_cast<SwitchInst>(&I)) {
        // Check cases for loops or significant control flow
        for (auto caseIt = swInst->case_begin(); caseIt != swInst->case_end(); ++caseIt) {
            BasicBlock *caseBlock = caseIt->getCaseSuccessor();

            // Check if the case block is part of a loop
            if (LI.isLoopHeader(caseBlock)) {
                return true;
            }

            // Check for significant instructions in the case block
            for (Instruction &caseInst : *caseBlock) {
                if (CallInst *callInst = dyn_cast<CallInst>(&caseInst)) {
                    Function *calledFunc = callInst->getCalledFunction();
                    if (!calledFunc) {
                        return true; // Function pointer detected
                    }
                    if (isIOFunction(calledFunc->getName())) {
                        return true; // I/O function detected
                    }
                    // Additionally, check if called function has loops or influential instructions
                    std::unordered_set<Function*> visited;
                    if (hasInfluentialInstructions(calledFunc, visited)) {
                        return true;
                    }
                }
            }
        }
    }

    return false; // Default to non-critical
}

bool KeyPointAnalysisPass::analyzeFunctionPointerInfluence(Module &M, ModuleAnalysisManager &MAM, CallInst *callInst) {
    std::unordered_set<Value *> visited;
    return traceFunctionPointerInfluence(M, MAM, callInst->getCalledOperand(), visited);
}

bool KeyPointAnalysisPass::traceFunctionPointerInfluence(Module &M, ModuleAnalysisManager &MAM, Value *val, std::unordered_set<Value *> &visited) {

    if (!val || visited.find(val) != visited.end())
        return false;

    visited.insert(val);

    if (dyn_cast<Argument>(val)) {
        return true;
    }

    if (LoadInst *loadInst = dyn_cast<LoadInst>(val)) {
        Value *pointerOperand = loadInst->getPointerOperand();
        return traceFunctionPointerInfluence(M, MAM, pointerOperand, visited);
    }

    if (Instruction *inst = dyn_cast<Instruction>(val)) {
        for (unsigned i = 0; i < inst->getNumOperands(); ++i) {
            if (traceFunctionPointerInfluence(M, MAM, inst->getOperand(i), visited)) {
                return true;
            }
        }
    }

    return false;
}