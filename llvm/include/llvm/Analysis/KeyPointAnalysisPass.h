#ifndef LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H
#define LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include <string>
#include <vector>
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopInfo.h"
#include <unordered_set>

namespace llvm {

struct KeyPointInfo {
    int line;
    std::string type;
    Instruction* inst;
    std::string funcName;
    KeyPointInfo(int l, const std::string &t, Instruction* i, const std::string &fn)
        : line(l), type(t), inst(i), funcName(fn){}
};

class KeyPointAnalysisPass : public PassInfoMixin<KeyPointAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "KeyPointAnalysisPass"; }

    const std::vector<KeyPointInfo> &getKeyPoints() const { return keyPoints; }

    static bool isRequired() { return true; }
private:
    void analyzeModule(Module &M, ModuleAnalysisManager &MAM);

    bool influencesRuntime(Instruction &I, LoopInfo &LI);

    std::vector<KeyPointInfo> keyPoints;

    bool analyzeFunctionPointerInfluence(Module &M, ModuleAnalysisManager &MAM, CallInst *callInst);

    bool traceFunctionPointerInfluence(Module &M, ModuleAnalysisManager &MAM, Value *val, std::unordered_set<Value *> &visited);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_KEYPOINTANALYSISPASS_H
