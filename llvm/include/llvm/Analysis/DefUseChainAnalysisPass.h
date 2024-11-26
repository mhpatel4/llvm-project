#ifndef LLVM_ANALYSIS_DEFUSECHAINANALYSISPASS_H
#define LLVM_ANALYSIS_DEFUSECHAINANALYSISPASS_H

#include "llvm/IR/PassManager.h"
#include <string>
#include <vector>
#include <map>
#include "llvm/IR/Instructions.h"

namespace llvm {

// Struct to store definition information
struct DefInfo {
    int line;
    std::string funcName;
    std::string instType;

    DefInfo(int l, const std::string &fn, const std::string &it)
        : line(l), funcName(fn), instType(it) {}
};

// Struct to store use information
struct UseInfo {
    int line;
    std::string funcName;
    std::string instType;

    UseInfo(int l, const std::string &fn, const std::string &it)
        : line(l), funcName(fn), instType(it) {}
};

// Struct to store def-use information for a variable
struct DefUseInfo {
    std::vector<DefInfo> defs;
    std::vector<UseInfo> uses;
};

class DefUseChainAnalysisPass : public PassInfoMixin<DefUseChainAnalysisPass> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    static llvm::StringRef name() { return "DefUseChainAnalysisPass"; }

    const std::map<std::string, DefUseInfo> &getDefUseChains() const { return defUseChains; }

    static bool isRequired() { return true; }

private:
    void analyzeModule(Module &M);
    std::string getVariableName(const Value *V);
    std::map<std::string, DefUseInfo> defUseChains;
};

} // namespace llvm

#endif // LLVM_ANALYSIS_DEFUSECHAINANALYSISPASS_H
