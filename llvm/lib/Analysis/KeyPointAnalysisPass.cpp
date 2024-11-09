#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses KeyPointAnalysisPass::run(Function &F, FunctionAnalysisManager &FAM) {
    // Analyze the function for key control points
    analyzeFunction(F);
    return PreservedAnalyses::all();
}

void KeyPointAnalysisPass::analyzeFunction(Function &F) {
    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            // Check for conditional branching instructions
            if (BranchInst *brInst = dyn_cast<BranchInst>(&I)) {
                if (brInst->isConditional()) {
                    int line = -1;
                    if (DILocation *Loc = I.getDebugLoc()) {
                        line = Loc->getLine();
                    }
                    keyPoints.emplace_back(line, "branch");

                    // Debug output for tracking
                    errs() << "Found conditional branch at Line " << line << "\n";
                }
            }
            // Check for calls through function pointers
            else if (CallInst *callInst = dyn_cast<CallInst>(&I)) {
                // If it's not a direct function call (function pointer call)
                if (!callInst->getCalledFunction()) {
                    int line = -1;
                    if (DILocation *Loc = I.getDebugLoc()) {
                        line = Loc->getLine();
                    }
                    keyPoints.emplace_back(line, "func_ptr_call");

                    // Debug output for tracking
                    errs() << "Found function pointer call at Line " << line << "\n";
                }
            }
        }
    }
}
