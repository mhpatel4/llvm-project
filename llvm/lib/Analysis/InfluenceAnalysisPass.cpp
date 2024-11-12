#include "llvm/Analysis/InfluenceAnalysisPass.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/LoopInfo.h"

using namespace llvm;

PreservedAnalyses InfluenceAnalysisPass::run(Function &F, FunctionAnalysisManager &FAM) {
    InputAnalysisPass inputPass;
    inputPass.run(F, FAM);

    KeyPointAnalysisPass keyPointPass;
    keyPointPass.run(F, FAM);

    const std::vector<KeyPointInfo> &keyPoints = keyPointPass.getKeyPoints();
    const std::vector<InputInfo> &inputInfo = inputPass.getInputInfo();

    std::set<const Value *> inputValues;
    for (const auto &input : inputInfo) {
        for (auto &BB : F) {
            for (auto &I : BB) {
                if (DILocation *Loc = I.getDebugLoc()) {
                    if (Loc->getLine() == static_cast<unsigned>(input.line)) {
                        inputValues.insert(&I);
                    }
                }
            }
        }
    }

    for (const auto &keyPoint : keyPoints) {
        if (isKeyPointInfluencedByInput(keyPoint, F, inputInfo)) {
            errs() << "Key point at line " << keyPoint.line 
                   << " of type " << keyPoint.type 
                   << " is influenced by input.\n";
        } else {
            errs() << "Key point at line " << keyPoint.line 
                   << " of type " << keyPoint.type 
                   << " is not influenced by input.\n";
        }
    }

    return PreservedAnalyses::all();
}

bool InfluenceAnalysisPass::isKeyPointInfluencedByInput(const KeyPointInfo &keyPoint, 
                                                        const Function &F, 
                                                        const std::vector<InputInfo> &inputInfo) {
    std::set<const Value *> inputValues;
    for (const auto &input : inputInfo) {
        for (auto &BB : F) {
            for (auto &I : BB) {
                if (DILocation *Loc = I.getDebugLoc()) {
                    if (Loc->getLine() == static_cast<unsigned>(input.line)) {
                        inputValues.insert(&I);
                    }
                }
            }
        }
    }

    for (auto &BB : F) {
        for (auto &I : BB) {
            if (DILocation *Loc = I.getDebugLoc()) {
                if (Loc->getLine() == static_cast<unsigned>(keyPoint.line)) {
                    std::set<const Value *> visited;
                    return isValueInfluencedByInput(&I, inputValues, visited);
                }
            }
        }
    }
    return false;
}

bool InfluenceAnalysisPass::isValueInfluencedByInput(const Value *V, const std::set<const Value *> &inputValues, std::set<const Value *> &visited) {
    if (visited.count(V))
        return false;
    visited.insert(V);

    if (inputValues.count(V))
        return true;

    if (const Instruction *I = dyn_cast<Instruction>(V)) {
        for (const Use &Op : I->operands()) {
            if (isValueInfluencedByInput(Op.get(), inputValues, visited))
                return true;
        }
    }
    return false;
}
