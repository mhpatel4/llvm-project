#include "llvm/Analysis/InfluenceAnalysisPass.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses InfluenceAnalysisPass::run(Function &F, FunctionAnalysisManager &FAM) {
    // Instantiated dependent passes
    InputAnalysisPass inputPass;
    inputPass.run(F, FAM);

    // Run dependent passes
    KeyPointAnalysisPass keyPointPass;
    keyPointPass.run(F, FAM);

    // Retrieve the analysis results
    const std::vector<KeyPointInfo> &keyPoints = keyPointPass.getKeyPoints();
    const std::vector<InputInfo> &inputInfo = inputPass.getInputInfo();

    // Analyze each key point to see if it is influenced by any inputs
    for (const auto &keyPoint : keyPoints) {
        if (isKeyPointInfluencedByInput(keyPoint, F, inputInfo)) {
            errs() << "Key point at line " << keyPoint.line 
                   << " of type " << keyPoint.type 
                   << " is influenced by input.\n";
        } else {
            errs() << "Key point at line " << keyPoint.line 
                   << " of type " << keyPoint.type 
                   << " is not influenced by input.\n";
        }
    }

    return PreservedAnalyses::all();
}

bool InfluenceAnalysisPass::isKeyPointInfluencedByInput(const KeyPointInfo &keyPoint, 
                                                        const Function &F, 
                                                        const std::vector<InputInfo> &inputInfo) {
    for (const InputInfo &input : inputInfo) {
        if (keyPoint.line == input.line) {
            return true;
        }
    }
    return false;
}
