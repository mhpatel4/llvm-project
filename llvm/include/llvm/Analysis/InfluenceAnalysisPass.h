#ifndef LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
#define LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Value.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include <vector>
#include <set>

namespace llvm {

class InfluenceAnalysisPass : public PassInfoMixin<InfluenceAnalysisPass> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);

    static llvm::StringRef name() { return "InfluenceAnalysisPass"; }
    static bool isRequired() { return true; }

private:
    bool isKeyPointInfluencedByInput(const KeyPointInfo &keyPoint, 
                                     const Function &F, 
                                     const std::vector<InputInfo> &inputInfo);

    // Helper function to recursively analyze def-use chains for influence
    bool isValueInfluencedByInput(const Value *V, const std::set<const Value *> &inputValues, std::set<const Value *> &visited);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
