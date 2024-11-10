#include "llvm/Analysis/InfluenceAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses InfluenceAnalysisPass::run(Function &F, FunctionAnalysisManager &FAM) {
    // Retrieve analysis results from InputAnalysisPass and KeyPointAnalysisPass
    auto &inputPass = FAM.getResult<InputAnalysisPass>(F);
    auto &keyPointPass = FAM.getResult<KeyPointAnalysisPass>(F);

    const std::vector<InputInfo> &inputInfo = inputPass.getInputInfo();
    const std::vector<KeyPointInfo> &keyPoints = keyPointPass.getKeyPoints();

    // Analyze each key point to check if it's influenced by inputs
    for (const KeyPointInfo &keyPoint : keyPoints) {
        bool influenced = isKeyPointInfluencedByInput(keyPoint, F, inputInfo);
        influenceResults.emplace_back(keyPoint.line, keyPoint.type, influenced);

        if (influenced) {
            errs() << "Key point at Line " << keyPoint.line << " (" << keyPoint.type 
                   << ") is influenced by input.\n";
        } else {
            errs() << "Key point at Line " << keyPoint.line << " (" << keyPoint.type 
                   << ") is NOT influenced by input.\n";
        }
    }

    return PreservedAnalyses::all();
}

bool InfluenceAnalysisPass::isKeyPointInfluencedByInput(const KeyPointInfo &keyPoint, 
                                                        const Function &F,
                                                        const std::vector<InputInfo> &inputInfo) {
    // For each key point, check if any input-derived variables influence it
    for (const InputInfo &input : inputInfo) {
        // Start tracing the def-use chain from input to check influence
        // For simplicity, we’re assuming a hypothetical getDefUseChain function exists
        // that returns the list of instructions in the def-use chain of a variable.
        
        /* Pseudo-code for def-use tracing:
        std::vector<Instruction*> defUseChain = getDefUseChain(input.variable);
        for (Instruction *I : defUseChain) {
            if (I corresponds to the variable in keyPoint's condition or expression) {
                return true;
            }
        }
        */
    }
    return false;
}
