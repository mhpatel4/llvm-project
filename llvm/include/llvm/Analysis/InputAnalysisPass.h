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
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "InputAnalysisPass"; }

    const std::vector<InputInfo> &getInputInfo() const { return inputInstructions; }

    static bool isRequired() { return true; }
private:
    bool isInputFunction(llvm::StringRef funcName);
    void analyzeModule(Module &M);

    std::vector<InputInfo> inputInstructions;
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INPUTANALYSISPASS_H