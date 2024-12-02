#ifndef LLVM_ANALYSIS_INPUTANALYSISPASS_H
#define LLVM_ANALYSIS_INPUTANALYSISPASS_H

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <vector>
#include "llvm/IR/DebugInfo.h"
#include <queue>
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/Metadata.h"
#include <unordered_set>
#include <sstream>
#include <regex>

namespace llvm {

// Struct to store information about each input function call
struct InputInfo {
    int line;
    std::string funcName;
    CallInst * callInst;

    InputInfo(int l, const std::string &fn, CallInst *CI) : line(l), funcName(fn), callInst(CI) {}
};

// Struct used in the dbgDeclareToVarMap to store information related to each dbg.declare in LLVM IR. Step 1 of Pass.
struct dbgObj {
    std::string ptrValue;
    std::string varName;
    std::string scope;
    std::string funcName;
};

class InputAnalysisPass : public PassInfoMixin<InputAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "InputAnalysisPass"; }

    const std::vector<InputInfo> &getInputInfo() const { return inputInstructions; }

    static bool isRequired() { return true; }
private:
    bool isInputFunction(llvm::StringRef funcName);
    void analyzeModule(Module &M);

    std::vector<InputInfo> inputInstructions;

    void printInstructionUsers(Instruction *inst, std::unordered_set<const Instruction*> &visited);
    
    void CreateVarNameToFuncScope(Module &M, ModuleAnalysisManager &MAM);

    // Helper function to find all scopes of Functions from LLVM IR
    std::unordered_map<std::string, std::string> findFunctionScopes(Module &M, ModuleAnalysisManager &MAM);

    //Helper function to find all variable names, their scopes, and virtual register from LLVM IR
    std::unordered_map<std::string, dbgObj> findVariableNamesAndScope(Module &M, ModuleAnalysisManager &MAM);

    //Helper function to map block scope to the scope of the function it is contained in
    std::unordered_map<std::string, std::string> findFunctionScopeFromBlock(Module &M, ModuleAnalysisManager &MAM);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_INPUTANALYSISPASS_H