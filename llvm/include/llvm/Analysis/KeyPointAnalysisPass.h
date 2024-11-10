#ifndef LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H
#define LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include <string>
#include <vector>

namespace llvm {

// Struct to store information about each key point in the code
struct KeyPointInfo {
    int line;
    std::string type;  // "branch" for conditional branches, "loop" for loops, "switch" for switch statements, "func_ptr_call" for function pointer calls

    KeyPointInfo(int l, const std::string &t) : line(l), type(t) {}
};

class KeyPointAnalysisPass : public PassInfoMixin<KeyPointAnalysisPass> {
public:
    // Analyzes function to identify key control points
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);

    static llvm::StringRef name() { return "KeyPointAnalysisPass"; }
    static bool isRequired() { return true; }

    // Getter to retrieve collected key point information
    const std::vector<KeyPointInfo> &getKeyPoints() const { return keyPoints; }

private:
    void analyzeFunction(Function &F);

    std::vector<KeyPointInfo> keyPoints;
};

} // namespace llvm

#endif // LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H