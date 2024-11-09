#ifndef LLVM_ANALYSIS_INPUTANALYSISPASS_H
#define LLVM_ANALYSIS_INPUTANALYSISPASS_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class InputAnalysisPass : public PassInfoMixin<InputAnalysisPass> {
public:
    // Analyzes function for calls to specific I/O-related functions and other sources of user input.
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
    
    // Static name method
    static llvm::StringRef name() { return "InputAnalysisPass"; }

    // Ensure that pass is not skipped by clang compiling optimizations
    static bool isRequired() { return true; }

private:
    // tags for I/O Input Functions
    bool isInputFunction(llvm::StringRef funcName);

    void analyzeFunction(llvm::Function &F);
}; // namespace llvm
}

#endif // LLVM_ANALYSIS_INPUTANALYSISPASS_H