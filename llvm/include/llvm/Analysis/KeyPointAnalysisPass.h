#ifndef LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H
#define LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include <string>
#include <vector>
#include "llvm/IR/Instructions.h"

namespace llvm {

struct KeyPointInfo {
    int line;
    std::string type;
    Instruction* inst;

    KeyPointInfo(int l, const std::string &t, Instruction* i)
        : line(l), type(t), inst(i) {}
};

class KeyPointAnalysisPass : public PassInfoMixin<KeyPointAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "KeyPointAnalysisPass"; }

    const std::vector<KeyPointInfo> &getKeyPoints() const { return keyPoints; }

    static bool isRequired() { return true; }
private:
    void analyzeModule(Module &M, ModuleAnalysisManager &MAM);

    std::vector<KeyPointInfo> keyPoints;
};

} // namespace llvm

#endif // LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H
