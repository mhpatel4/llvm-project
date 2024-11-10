#ifndef LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
#define LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include <unordered_map>
#include <vector>

namespace llvm {

struct InfluenceInfo {
    int line;                  // Line number of the key point
    std::string keyPointType;  // Type of key point (branch, loop, switch, func_ptr_call)
    bool isInfluenced;         // True if the key point is influenced by input

    InfluenceInfo(int l, const std::string &t, bool inf) 
        : line(l), keyPointType(t), isInfluenced(inf) {}
};

class InfluenceAnalysisPass : public PassInfoMixin<InfluenceAnalysisPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);

    static llvm::StringRef name() { return "InfluenceAnalysisPass"; }
    static bool isRequired() { return true; }

private:
    bool isKeyPointInfluencedByInput(const KeyPointInfo &keyPoint, const Function &F,
                                     const std::vector<InputInfo> &inputInfo);

    // Stores influence information for each key point
    std::vector<InfluenceInfo> influenceResults;
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
