#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Pass.h"

using namespace llvm;

PreservedAnalyses KeyPointAnalysisPass::run(Function &F, FunctionAnalysisManager &FAM) {
    // Analyze the function for key control points
    analyzeFunction(F, FAM);
    return PreservedAnalyses::all();
}

void KeyPointAnalysisPass::analyzeFunction(Function &F, FunctionAnalysisManager &FAM) {
    // Fetch LoopInfo for loop detection
    LoopInfo &LI = FAM.getResult<LoopAnalysis>(F);

    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            // Detect conditional branches (if-else and loop conditions)
            if (BranchInst *brInst = dyn_cast<BranchInst>(&I)) {
                if (brInst->isConditional()) {
                    int line = -1;
                    if (DILocation *Loc = I.getDebugLoc()) {
                        line = Loc->getLine();
                    }

                    std::string type = "branch";

                    // Check if this branch is part of a loop
                    if (LI.isLoopHeader(&BB)) {
                        type = "loop";
                    }

                    keyPoints.emplace_back(line, type);
                    errs() << "Found conditional " << type << " at Line " << line << "\n";
                }
            }
            // Detect switch statements
            else if (isa<SwitchInst>(&I)) {
                int line = -1;
                if (DILocation *Loc = I.getDebugLoc()) {
                    line = Loc->getLine();
                }
                keyPoints.emplace_back(line, "switch");
                errs() << "Found switch statement at Line " << line << "\n";
            }
            // Detect calls through function pointers
            else if (CallInst *callInst = dyn_cast<CallInst>(&I)) {
                if (!callInst->getCalledFunction()) { // Indirect call (function pointer)
                    int line = -1;
                    if (DILocation *Loc = I.getDebugLoc()) {
                        line = Loc->getLine();
                    }
                    keyPoints.emplace_back(line, "func_ptr_call");
                    errs() << "Found function pointer call at Line " << line << "\n";
                }
            }
        }
    }
}