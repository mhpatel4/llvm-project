#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/ADT/SmallVector.h"
#include <unordered_set>
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/IntrinsicInst.h"

using namespace llvm;

PreservedAnalyses InputAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeModule(M);
    return PreservedAnalyses::all();
}

void InputAnalysisPass::analyzeModule(Module &M) {
    for (Function &F : M) {
        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                    Function *calledFunc = CI->getCalledFunction();
                    if (!calledFunc)
                        continue;

                    StringRef funcName = calledFunc->getName();
                    if (isInputFunction(funcName)) {
                        int line = -1;
                        if (DILocation *Loc = I.getDebugLoc()) {
                            line = Loc->getLine();
                        }
                        
                        inputInstructions.emplace_back(line, funcName.str());
                    }
                }
            }
        }
    }
}

bool InputAnalysisPass::isInputFunction(StringRef funcName) {
    return funcName == "scanf" || funcName == "__isoc99_scanf" ||
           funcName == "getc" || funcName == "fopen" || 
           funcName == "fclose" || funcName == "fread" || 
           funcName == "fwrite" || funcName == "getenv" || 
           funcName == "getopt";
}