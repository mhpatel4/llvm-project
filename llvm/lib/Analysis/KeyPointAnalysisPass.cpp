#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Analysis/LoopInfo.h"

using namespace llvm;

PreservedAnalyses KeyPointAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeModule(M, MAM);
    return PreservedAnalyses::all();
}

void KeyPointAnalysisPass::analyzeModule(Module &M, ModuleAnalysisManager &MAM) {
    auto &FAM = MAM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();

    for (Function &F : M) {
        if (F.isDeclaration()) continue;

        LoopInfo &LI = FAM.getResult<LoopAnalysis>(F);

        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                if (BranchInst *brInst = dyn_cast<BranchInst>(&I)) {
                    if (brInst->isConditional()) {
                        int line = -1;
                        if (DILocation *Loc = I.getDebugLoc()) {
                            line = Loc->getLine();
                        }
                        std::string type = LI.isLoopHeader(&BB) ? "loop" : "branch";
                        keyPoints.emplace_back(line, type);
                    }
                } else if (isa<SwitchInst>(&I)) {
                    int line = -1;
                    if (DILocation *Loc = I.getDebugLoc()) {
                        line = Loc->getLine();
                    }
                    keyPoints.emplace_back(line, "switch");
                } else if (CallInst *callInst = dyn_cast<CallInst>(&I)) {
                    if (!callInst->getCalledFunction()) {
                        int line = -1;
                        if (DILocation *Loc = I.getDebugLoc()) {
                            line = Loc->getLine();
                        }
                        keyPoints.emplace_back(line, "func_ptr_call");
                    }
                }
            }
        }
    }
}
