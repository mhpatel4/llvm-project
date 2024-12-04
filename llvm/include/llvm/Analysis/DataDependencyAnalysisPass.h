#ifndef LLVM_ANALYSIS_DATADEPENDENCYANALYSISPASS_H
#define LLVM_ANALYSIS_DATADEPENDENCYANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Value.h"
#include <string>
#include <vector>
#include <unordered_map>
#include "llvm/IR/Instructions.h"
#include <unordered_set>
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"

namespace llvm {

class DataDependencyAnalysisPass : public PassInfoMixin<DataDependencyAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "DataDependencyAnalysisPass"; }

    static bool isRequired() { return true; }

private:
    void analyzeDependencies(Module &M, ModuleAnalysisManager &MAM);
    void printDefiningInstruction(Module &M, ModuleAnalysisManager &MAM, const std::unordered_map<std::string, dbgObj>& varNameAndScope, std::string funcName, Value* val, std::unordered_set<Value*> &visited, int depth = 0, int maxDepth = 10);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_DATADEPENDENCYANALYSISPASS_H
