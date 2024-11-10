#ifndef LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
#define LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include <vector>

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
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
