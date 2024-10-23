// InputVariablePass.h
#ifndef LLVM_ANALYSIS_INPUTVARIABLEPASS_H
#define LLVM_ANALYSIS_INPUTVARIABLEPASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassPlugin.h"

namespace llvm {
    // The input variable analysis pass declaration
    struct InputVariablePass : public PassInfoMixin<InputVariablePass> {
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
    };
}

#endif