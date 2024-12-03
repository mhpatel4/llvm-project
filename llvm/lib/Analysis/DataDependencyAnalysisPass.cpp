#include "llvm/Analysis/DataDependencyAnalysisPass.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <vector>
#include "llvm/IR/DebugInfo.h"
#include <queue>
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/Transforms/Utils/Local.h"
#include <unordered_set>
#include <sstream>
#include <regex>

using namespace llvm;

PreservedAnalyses DataDependencyAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeDependencies(M, MAM);
    
    return PreservedAnalyses::all();
}

void DataDependencyAnalysisPass::analyzeDependencies(Module &M, ModuleAnalysisManager &MAM) {
    // errs() << M << "\n";
    // Run InputAnalysisPass to gather input information
    InputAnalysisPass inputPass;
    inputPass.run(M, MAM);

    // Run KeyPointAnalysisPass to gather key point information
    KeyPointAnalysisPass keyPointPass;
    keyPointPass.run(M, MAM);

    // Retrieve information from passes
    const std::unordered_map<std::string, dbgObj>& varNameAndScope = inputPass.varNameInformation;
    // Check if variable scopes are updated from block to function
    errs() << "varNameAndScope contents after using blockMapping to get scopes of functions:\n";
    for (const auto &entry : varNameAndScope) {
        const dbgObj &obj = entry.second;
        
        errs() << "Variable name: " << obj.varName << " , Pointer value: " << obj.ptrValue << " , Scope: " << obj.scope << " , Function : " << obj.funcName <<"\n";
    }   
    errs() << "\n";

    const std::vector<InputInfo> &inputs = inputPass.getInputInfo();
    const std::vector<KeyPointInfo> &keyPoints = keyPointPass.getKeyPoints();
    
    // Debug output: Print information stored in inputInfo with arguments
    errs() << "Input Functions Identified:\n";
    for (const auto &input : inputs) {
        if (input.funcName == "__isoc99_scanf") {
            errs() << "  - Found input function: scanf at Line " << input.line << ".";
        } else {
            errs() << "  - Found input function: " << input.funcName << " at Line " << input.line << ".";
        }
        errs() << "\n";
    }

    // Debug output: Print information stored in keyPoints
    errs() << "\nKey Points Identified:\n";
    for (const auto &keyPoint : keyPoints) {
        errs() << "  - Key point at line " << keyPoint.line << " of type " << keyPoint.type << "\n";
    }
    errs() << "\n";

    std::unordered_set<std::string> relevantTypes = {"loop", "func_ptr_call"};

    for (const auto &keyPoint : keyPoints) {
        if (relevantTypes.find(keyPoint.type) == relevantTypes.end()) {
            continue; // Skip non-relevant keypoints
        }

        Instruction *keyInst = keyPoint.inst;
        if (!keyInst) continue; // Safety check
        
        // Debug information
        errs() << "Analyzing Keypoint Instruction at Line:" << keyPoint.line << "\n";
        keyInst->print(llvm::errs());
        errs() << "\nOperands and Dependencies:\n";

        std::unordered_set<Value*> visited;

        // Traverse each operand of the keypoint instruction
        for (unsigned i = 0; i < keyInst->getNumOperands(); ++i) {
            Value* operand = keyInst->getOperand(i);
            printDefiningInstruction(operand, visited);
        }

        errs() << "\n";
    }
}

void DataDependencyAnalysisPass::printDefiningInstruction(Value* val, std::unordered_set<Value*> &visited, int depth, int maxDepth) {
    if (depth > maxDepth || !val || visited.find(val) != visited.end())
        return;

    visited.insert(val);

    // Skip constant values
    if (isa<Constant>(val))
        return;

    // Handle function arguments
    if (Argument* arg = dyn_cast<Argument>(val)) {
        errs() << "  - Function Argument: " << arg->getName() << "\n";
        return;
    }

    // Handle global variables
    if (GlobalVariable* gv = dyn_cast<GlobalVariable>(val)) {
        errs() << "  - Global Variable: " << gv->getName() << "\n";
        return;
    }

    // Get the defining instruction
    if (Instruction* defInst = dyn_cast<Instruction>(val)) {
        errs() << "  - Defining Instruction: ";
        defInst->print(llvm::errs());
        errs() << "\n";

        // Recursively traverse the operands of the defining instruction
        for (unsigned i = 0; i < defInst->getNumOperands(); ++i) {
            Value* operand = defInst->getOperand(i);
            printDefiningInstruction(operand, visited, depth + 1, maxDepth);
        }
    }
}

// std::string DataDependencyAnalysisPass::getValueString(Value *val) {
//     std::string str;
//     raw_string_ostream rso(str);
//     val->printAsOperand(rso, false);
//     rso.flush();
//     return str;
// }