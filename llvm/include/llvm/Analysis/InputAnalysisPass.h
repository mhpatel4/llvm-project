#ifndef LLVM_ANALYSIS_INPUTANALYSISPASS_H
#define LLVM_ANALYSIS_INPUTANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include <string>
#include <vector>

namespace llvm {

// Struct to store information about each input function call
struct InputInfo {
    int line;
    std::string funcName;

    InputInfo(int l, const std::string &fn) : line(l), funcName(fn) {}
};

class InputAnalysisPass : public PassInfoMixin<InputAnalysisPass> {
public:
    // Analyzes function for calls to specific I/O-related functions
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
    
    static llvm::StringRef name() { return "InputAnalysisPass"; }
    static bool isRequired() { return true; }

    // Getter to retrieve collected input information
    const std::vector<InputInfo> &getInputInfo() const { return inputInstructions; }

private:
    bool isInputFunction(llvm::StringRef funcName);
    void analyzeFunction(llvm::Function &F);

    std::vector<InputInfo> inputInstructions;
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INPUTANALYSISPASS_H