#ifndef LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
#define LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Value.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include <vector>
#include <set>
#include <string>
#include <map>

namespace llvm {

class InfluenceAnalysisPass : public PassInfoMixin<InfluenceAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "InfluenceAnalysisPass"; }

private:
    bool backwardSlicing(Value *V, std::set<Value *> &visited, std::vector<Value *> &path,
                         const std::set<Value *> &inputValues);
    void printValueInfo(Value *V);
    void collectInputValues(const std::vector<InputInfo> &inputInfo,
                            std::multimap<int, Instruction *> &lineToInstructionMap,
                            std::set<Value *> &inputValues);
    bool isInputFunction(StringRef funcName);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INFLUENCEANALYSISPASS_H
