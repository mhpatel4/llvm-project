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

// Struct to store seminal input features for each key point
struct SeminalFeature {
    int keyPointLine;
    std::vector<AllocaInst*> inputAllocas;
};

class DataDependencyAnalysisPass : public PassInfoMixin<DataDependencyAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "DataDependencyAnalysisPass"; }

    const std::vector<SeminalFeature> &getSeminalFeatures() const { return seminalFeatures; }

    static bool isRequired() { return true; }

private:
    void analyzeDependencies(Module &M, ModuleAnalysisManager &MAM);

    std::vector<SeminalFeature> seminalFeatures;

    // Add a mapping from AllocaInst to variable names (to be implemented later)
    std::unordered_map<AllocaInst*, std::string> allocaToVarNameMap;

    // Helper function to trace dependencies from a Value to input Allocas
    void traceDependency(Value *V, std::unordered_set<Value*> &visited, std::vector<AllocaInst*> &inputAllocas);

    // Helper function to collect input Allocas from InputAnalysisPass
    std::vector<AllocaInst*> collectInputAllocas(Module &M, const std::vector<InputInfo> &inputs);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_DATADEPENDENCYANALYSISPASS_H
