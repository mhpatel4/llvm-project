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

// Struct used in the dbgDeclareToVarMap to store information related to each dbg.declare in LLVM IR. Step 1 of Pass.
struct dbgObj {
    std::string ptrValue;
    std::string varName;
    std::string scope;
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

    // Helper function to trace dependencies from a Value to input Allocas
    void traceDependency(Value *V, std::unordered_set<Value*> &visited, std::vector<AllocaInst*> &inputAllocas);

    // Helper function to collect input Allocas from InputAnalysisPass
    std::unordered_map<AllocaInst*, std::string> collectInputAllocas(Module &M, ModuleAnalysisManager &MAM, const std::vector<InputInfo> &inputs);

    // Helper function to find all scopes of Functions from LLVM IR
    std::unordered_map<std::string, std::string> findFunctionScopes(Module &M, ModuleAnalysisManager &MAM);

    //Helper function to find all variable names, their scopes, and virtual register from LLVM IR
    std::unordered_map<std::string, dbgObj> findVariableNamesAndScope(Module &M, ModuleAnalysisManager &MAM);

    //Helper function to map block scope to the scope of the function it is contained in
    //std::unordered_map<std::string, dbgObj> findFunctionScopeFromBlock(Module &M, ModuleAnalysisManager &MAM)
};

} // namespace llvm

#endif // LLVM_ANALYSIS_DATADEPENDENCYANALYSISPASS_H
