#include "llvm/Analysis/InfluenceAnalysisPass.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <vector>
#include "llvm/IR/DebugInfo.h"

using namespace llvm;

PreservedAnalyses InfluenceAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    // Run InputAnalysisPass to gather input information
    InputAnalysisPass inputPass;
    inputPass.run(M, MAM);
    const std::vector<InputInfo> &inputInfo = inputPass.getInputInfo();

    // Run KeyPointAnalysisPass to gather key point information
    KeyPointAnalysisPass keyPointPass;
    keyPointPass.run(M, MAM);
    const std::vector<KeyPointInfo> &keyPoints = keyPointPass.getKeyPoints();

    // Maps line numbers to instructions
    std::multimap<int, Instruction *> lineToInstructionMap;

    // Build the mapping from line numbers to instructions
    for (Function &F : M) {
        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                if (DILocation *Loc = I.getDebugLoc()) {
                    int line = Loc->getLine();
                    lineToInstructionMap.insert({line, &I});
                }
            }
        }
    }

    // Collect input values
    std::set<Value *> inputValues;
    collectInputValues(inputInfo, lineToInstructionMap, inputValues);

    // Debug output: Print information stored in inputInfo with arguments
    errs() << "Input Functions Identified:\n";
    for (const auto &input : inputInfo) {
        errs() << "  - Found input function: " << input.funcName << " at Line " << input.line << ".";
        errs() << "\n";
    }

    // Debug output: Print information stored in keyPoints
    errs() << "\nKey Points Identified:\n";
    for (const auto &keyPoint : keyPoints) {
        errs() << "  - Key point at line " << keyPoint.line << " of type " << keyPoint.type << "\n";
    }

    // Analyze influence for each key point
    for (const auto &keyPoint : keyPoints) {
        int line = keyPoint.line;
        std::string type = keyPoint.type;

        auto range = lineToInstructionMap.equal_range(line);
        for (auto it = range.first; it != range.second; ++it) {
            Instruction *I = it->second;

            // Check if the instruction matches the key point type
            bool isMatch = false;
            Value *V = nullptr;
            if ((type == "branch" || type == "loop") && isa<BranchInst>(I)) {
                BranchInst *BI = cast<BranchInst>(I);
                if (BI->isConditional()) {
                    V = BI->getCondition();
                    isMatch = true;
                }
            } else if (type == "switch" && isa<SwitchInst>(I)) {
                SwitchInst *SI = cast<SwitchInst>(I);
                V = SI->getCondition();
                isMatch = true;
            } else if (type == "func_ptr_call" && isa<CallInst>(I)) {
                CallInst *CI = cast<CallInst>(I);
                if (!CI->getCalledFunction()) { // Indirect call
                    V = CI->getCalledOperand();
                    isMatch = true;
                }
            }

            if (isMatch && V) {
                // Perform backward slicing
                std::set<Value *> visited;
                std::vector<Value *> path;
                if (backwardSlicing(V, visited, path, inputValues)) {
                    // Print the trace
                    errs() << "\nKey point at line " << line << " is influenced by input.\n";
                    errs() << "Traceback:\n";
                    for (Value *val : path) {
                        printValueInfo(val);
                    }
                } else {
                    errs() << "\nKey point at line " << line << " is not influenced by input.\n";
                }
            }
        }
    }

    return PreservedAnalyses::all();
}

bool InfluenceAnalysisPass::backwardSlicing(Value *V, std::set<Value *> &visited,
                                            std::vector<Value *> &path,
                                            const std::set<Value *> &inputValues) {
    if (!V || visited.count(V))
        return false;

    visited.insert(V);
    path.push_back(V);

    // Check if V is an input value
    if (inputValues.count(V)) {
        return true;
    }

    if (Instruction *I = dyn_cast<Instruction>(V)) {
        // Handle StoreInst: track the value being stored
        if (StoreInst *SI = dyn_cast<StoreInst>(I)) {
            Value *valueOperand = SI->getValueOperand();
            if (backwardSlicing(valueOperand, visited, path, inputValues))
                return true;
        }

        // Handle LoadInst: need to check the pointer operand
        if (LoadInst *LI = dyn_cast<LoadInst>(I)) {
            Value *pointer = LI->getPointerOperand()->stripPointerCasts();
            // If the pointer itself is influenced by input
            if (backwardSlicing(pointer, visited, path, inputValues))
                return true;

            // Additionally, find all StoreInsts that write to this pointer
            for (User *U : pointer->users()) {
                if (StoreInst *SI = dyn_cast<StoreInst>(U)) {
                    if (SI->getPointerOperand()->stripPointerCasts() == pointer) {
                        if (backwardSlicing(SI->getValueOperand(), visited, path, inputValues))
                            return true;
                    }
                }
            }
        }

        // Handle other operands recursively
        for (Use &U : I->operands()) {
            if (backwardSlicing(U.get(), visited, path, inputValues))
                return true;
        }
    } else if (isa<Argument>(V)) {
        // Handle function arguments if necessary
    } else if (isa<GlobalVariable>(V)) {
        // Handle global variables if necessary
    } else if (isa<AllocaInst>(V)) {
        // For local variables, check if they are in inputValues
        if (inputValues.count(V)) {
            return true;
        }
    }

    path.pop_back();
    return false;
}

// Updated printValueInfo function
void InfluenceAnalysisPass::printValueInfo(Value *V) {
    if (Instruction *I = dyn_cast<Instruction>(V)) {
        if (DILocation *Loc = I->getDebugLoc()) { // Use '->' instead of '.'
            errs() << "  - Instruction at line " << Loc->getLine() << ": ";
            if (I->hasName()) {
                errs() << I->getName();
            } else if (AllocaInst *AI = dyn_cast<AllocaInst>(I)) {
                // Iterate over users to find DbgVariableIntrinsic
                bool found = false;
                for (User *U : AI->users()) {
                    if (DbgVariableIntrinsic *DVI = dyn_cast<DbgVariableIntrinsic>(U)) {
                        if (DILocalVariable *Var = DVI->getVariable()) {
                            errs() << Var->getName();
                            found = true;
                            break;
                        }
                    }
                }
                if (!found) {
                    errs() << "(unknown variable)";
                }
            }
            errs() << "\n";
        }
    } else if (Argument *Arg = dyn_cast<Argument>(V)) {
        errs() << "  - Function argument: " << Arg->getName() << "\n";
    } else if (GlobalVariable *GV = dyn_cast<GlobalVariable>(V)) {
        errs() << "  - Global variable: " << GV->getName() << "\n";
    } else if (isa<Constant>(V)) {
        errs() << "  - Constant value\n";
    } else {
        errs() << "  - Unknown value\n";
    }
}

void InfluenceAnalysisPass::collectInputValues(const std::vector<InputInfo> &inputInfo,
                                               std::multimap<int, Instruction *> &lineToInstructionMap,
                                               std::set<Value *> &inputValues) {
    for (const auto &input : inputInfo) {
        int line = input.line;
        auto range = lineToInstructionMap.equal_range(line);
        for (auto it = range.first; it != range.second; ++it) {
            Instruction *I = it->second;
            if (CallInst *CI = dyn_cast<CallInst>(I)) {
                Function *calledFunc = CI->getCalledFunction();
                if (calledFunc && calledFunc->getName() == input.funcName) {
                    // Collect the variables where input is stored
                    for (unsigned i = 0; i < CI->getNumOperands() - 1; ++i) {
                        Value *arg = CI->getArgOperand(i);
                        // For scanf, arguments are pointers to variables
                        if (arg->getType()->isPointerTy()) {
                            // Get the underlying variable
                            Value *var = arg->stripPointerCasts();
                            inputValues.insert(var);
                        }
                    }
                }
            }
        }
    }
}

bool InfluenceAnalysisPass::isInputFunction(StringRef funcName) {
    return funcName == "scanf" || funcName == "__isoc99_scanf" ||
           funcName == "getc" || funcName == "fopen" ||
           funcName == "fclose" || funcName == "fread" ||
           funcName == "fwrite" || funcName == "getenv" ||
           funcName == "getopt";
}