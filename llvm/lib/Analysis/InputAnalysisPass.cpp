#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses InputAnalysisPass::run(Function &F, FunctionAnalysisManager &FAM) {
    analyzeFunction(F);
    return PreservedAnalyses::all();
}

void InputAnalysisPass::analyzeFunction(Function &F) {
    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                Function *calledFunc = CI->getCalledFunction();
                if (!calledFunc) continue;
                
                StringRef funcName = calledFunc->getName();
                if (isInputFunction(funcName)) {
                    if (DILocation *Loc = I.getDebugLoc()) {
                        int line = Loc->getLine();
                        // errs() << "Line " << line << ": " << funcName << "\n";
                        if (funcName == "__isoc99_scanf")
                            errs() << "Found an input function: scanf at Line " << line << "\n";
                        else
                            errs() << "Found an input function: " << funcName << " at Line " << line << "\n";
                    } else {
                        errs() << "Found an input function: " << funcName << " with no debug location.\n";
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