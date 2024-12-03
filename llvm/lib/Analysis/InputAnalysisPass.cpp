#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <vector>
#include "llvm/IR/DebugInfo.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/Transforms/Utils/Local.h"
#include <unordered_set>
#include <sstream>
#include <regex>

using namespace llvm;

PreservedAnalyses InputAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeModule(M);

    varNameInformation = CreateVarNameToFuncScope(M, MAM);
    return PreservedAnalyses::all();
}

void InputAnalysisPass::analyzeModule(Module &M) {
    for (Function &F : M) {
        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                if (CallInst *CI = dyn_cast<CallInst>(&I)) {
                    Function *calledFunc = CI->getCalledFunction();
                    if (!calledFunc)
                        continue;

                    StringRef funcName = calledFunc->getName();
                    if (isInputFunction(funcName)) {
                        int line = -1;
                        if (DILocation *Loc = I.getDebugLoc()) {
                            line = Loc->getLine();
                        }
                        inputInstructions.emplace_back(line, funcName.str(), CI);
                    }
                }
            }
        }
    }
}

bool InputAnalysisPass::isInputFunction(StringRef funcName) {
    return funcName == "scanf" || funcName == "__isoc99_scanf" ||
           funcName == "getc" || funcName == "fopen" || 
           funcName == "fclose" || funcName == "fread" || 
           funcName == "fwrite";
}

std::unordered_map<std::string, dbgObj> InputAnalysisPass::CreateVarNameToFuncScope(Module &M, ModuleAnalysisManager &MAM) {
    // Step 0: Get all function names and associated scopes
    std::unordered_map<std::string, std::string> functionScopes = findFunctionScopes(M, MAM);

    // Step 1: map all blocks scopes to function scopes
    std::unordered_map<std::string, std::string> blockMapping = findFunctionScopeFromBlock(M, MAM);

    // Step 2: get the variable name, metadataid, pointer value, and scope of each DiLocalVariable
    std::unordered_map<std::string, dbgObj> varNameAndScope = findVariableNamesAndScope(M, MAM);

    // Step 3: update scopes of DiLocalVariables if they are for blocks to the functions they represent
    for (auto& [key, obj] : varNameAndScope) {
        auto it = blockMapping.find(obj.scope);
        if (it != blockMapping.end()) {
            varNameAndScope[key].scope =  it->second;
        }
        auto name = functionScopes.find(varNameAndScope[key].scope);
        if (name != functionScopes.end()) {
            varNameAndScope[key].funcName = name->second;
        }
    }

    // Check if variable scopes are updated from block to function
    // errs() << "varNameAndScope contents after using blockMapping to get scopes of functions:\n";
    // for (const auto &entry : varNameAndScope) {
    //     const dbgObj &obj = entry.second;
        
    //     errs() << "Variable name: " << obj.varName << " , Pointer value: " << obj.ptrValue << " , Scope: " << obj.scope << " , Function : " << obj.funcName <<"\n";
    // }   
    // errs() << "\n";

    return varNameAndScope;
}

//Extract function names and associated scope ID
std::unordered_map<std::string, std::string> InputAnalysisPass::findFunctionScopes(Module &M, ModuleAnalysisManager &MAM) {
    std::string ModuleIR;
    raw_string_ostream ModuleStream(ModuleIR);
    M.print(ModuleStream, nullptr);
    ModuleStream.flush();

    std::istringstream stream(ModuleIR);
    std::string line;
    std::unordered_map<std::string, std::string> functionScopes;

    while (std::getline(stream, line)) { 
        if (line.find("define") != std::string::npos) {
            std::string scope;
            std::string name;

            // extract the scaope
            std::size_t dbgPos = line.find("!dbg");
            std::size_t exclamPos = line.find('!', dbgPos + 4); // 4 is the length of "!dbg"
            std::size_t endPos = line.find_first_of(" {", exclamPos);
            scope = line.substr(exclamPos, endPos - exclamPos);
    
            // extract the function name
            std::size_t namePos = line.find("@") + 1;
            std::size_t nameEndPos = line.find("(");
            name = line.substr(namePos, nameEndPos - namePos);

            functionScopes[scope] = name;
        }
    }
    return functionScopes;
}

std::unordered_map<std::string, std::string> InputAnalysisPass::findFunctionScopeFromBlock(Module &M, ModuleAnalysisManager &MAM) {
    // Extract Information from dbg.declare in LLVM IR
    std::string IRString;
    raw_string_ostream IRStream(IRString);
    M.print(IRStream, nullptr);
    IRStream.flush();

    std::istringstream stream(IRString);
    std::string line;
    std::unordered_map<std::string, std::string> scopeMap;
    std::vector<std::string> blockLines;
    std::unordered_map<std::string, std::string> blockMapping;

    while (std::getline(stream, line)) { 
        if (line.find("= distinct !DILexicalBlock") != std::string::npos) { 
            blockLines.push_back(line);
        }
    }

    std::regex regex(R"(!(\d+) = distinct !DILexicalBlock\(scope: !(\d+),)");
    for (const auto &line : blockLines) {
        std::smatch match;
        if (std::regex_search(line, match, regex)) {
            std::string block = "!" + match[1].str();
            std::string scope = "!" + match[2].str();
            scopeMap[block] = scope;
        }
    }

    for (const auto& [block, scope] : scopeMap) {
        std::string current = scope;
        while (scopeMap.find(current) != scopeMap.end()) {
            current = scopeMap[current];
        }
        blockMapping[block] = current;
    }
    return blockMapping;
}

std::unordered_map<std::string, dbgObj> InputAnalysisPass::findVariableNamesAndScope(Module &M, ModuleAnalysisManager &MAM) {
    // Extract Information from dbg.declare in LLVM IR
    // Step 1: Get all dbg.declare statements from IR using print streams
    std::string IRString;
    raw_string_ostream IRStream(IRString);
    M.print(IRStream, nullptr);
    IRStream.flush();

    std::istringstream stream(IRString);
    std::string line;
    std::vector<std::string> dbgDeclareLines;

    while (std::getline(stream, line)) { 
        if (line.find("dbg_declare") != std::string::npos) 
            { 
                dbgDeclareLines.push_back(line);
                // errs() << line << "\n";
            }
    }
    // errs() << "\n";

    std::unordered_map<std::string, dbgObj> dbgDeclareToVarMap;

    // Step 2: Extract the metadata ID (e.g., "!15") from the dbg_declare line
    for (const auto &dbgLine : dbgDeclareLines) {
        std::size_t startPos = dbgLine.find("ptr") + 4;
        std::size_t endPos = dbgLine.find(",", startPos);
        std::string allocaName = dbgLine.substr(startPos, endPos - startPos);

        // Extract the pointer (e.g., "%5") from the dbg_declare line
        std::size_t ptrStartPos = dbgLine.find("ptr") + 4;
        std::size_t ptrEndPos = dbgLine.find(",", ptrStartPos);
        std::string ptrValue = dbgLine.substr(ptrStartPos, ptrEndPos - ptrStartPos);

        // Now, search for the corresponding metadata ID to get the variable name
        std::size_t metaStartPos = dbgLine.find("!") + 1;
        std::size_t metaEndPos = dbgLine.find(",", metaStartPos);
        std::string metadataID = dbgLine.substr(metaStartPos, metaEndPos - metaStartPos);

        std::string debugLine;
        std::string metadataIDSearch = "!" + metadataID + " = !";  // Create search pattern for matching the metadataID

        // Reset the stream to start from the beginning again to find the metadata match
        stream.clear();
        stream.seekg(0, std::ios::beg);

        // Step 3: Find the DilocalVariable line with the associated metadataID
        while (std::getline(stream, debugLine)) {
            // Check if the current line contains the metadata ID we're searching for
            if (debugLine.find(metadataIDSearch) != std::string::npos) {
                // Extract the variable name
                std::size_t nameStartPos = debugLine.find("name: \"");
                if (nameStartPos == std::string::npos) {
                    // "name: \"" not found; skip to the next line
                    continue;
                }
                nameStartPos += 7; // Move past "name: \""
            
                std::size_t nameEndPos = debugLine.find("\"", nameStartPos);
                if (nameEndPos == std::string::npos) {
                    // Closing quote for name not found; skip to the next line
                    continue;
                }
            
                std::string varName = debugLine.substr(nameStartPos, nameEndPos - nameStartPos);

                // Extract the scope identifier
                std::size_t scopeStartPos = debugLine.find("scope: !");
                if (scopeStartPos == std::string::npos) {
                    // "scope: !" not found; handle accordingly (e.g., assign a default value or skip)
                    // llvm::errs() << "Warning: 'scope: !' not found in line: " << debugLine << "\n";
                    continue; // Skip this line or handle as per your requirements
                }
                scopeStartPos += 7; // Move past "scope: !"
            
                std::size_t scopeEndPos = debugLine.find(",", scopeStartPos);
                if (scopeEndPos == std::string::npos) {
                    // Comma after scope identifier not found; assume end of line
                    scopeEndPos = debugLine.length();
                }
            
                std::string scope = debugLine.substr(scopeStartPos, scopeEndPos - scopeStartPos);
            
                // Create and populate the dbgObj instance
                dbgObj newEntry;
                newEntry.varName = varName;
                newEntry.ptrValue = ptrValue;
                newEntry.scope = scope;
            
                // Insert the newEntry into the map with metadataIDSearch as the key
                // errs() << "Name: " << varName << " with MetaID: " << metadataIDSearch << "\n";

                dbgDeclareToVarMap[metadataIDSearch] = newEntry;
            }
        }
    }

    return dbgDeclareToVarMap;
}