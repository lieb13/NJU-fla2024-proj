#include <iostream>
#include <vector>
#include "parser.h"
#include "TM.h"
#include "PDA.h"
#include "exception.h"

using namespace std;
int main(int argc, char* argv[]){
    
    // if (argc < 3) {
    //     std::cerr << "Usage: fla [-v|--verbose] [-h|--help] <pda|tm> <input>" << std::endl;
    //     return 1;
    // }

    std::vector<std::string> args(argv, argv + argc);
    bool verbose = false;
    std::string filename, input;
    
    for (size_t i = 1; i < args.size(); i++) {
        if (args[i] == "-h" || args[i] == "--help") {
            std::cout << "Usage: fla [-v|--verbose] [-h|--help] <pda|tm> <input>" << std::endl;
            return 0;
        } else if (args[i] == "-v" || args[i] == "--verbose") {
            verbose = true;
        } else if (filename.empty()) {
            filename = args[i];
        } else if (input.empty()) {
            input = args[i];
        } else {
            std::cerr << "Error: Too many arguments." << std::endl;
            return 1;
        }
    }

    if (filename.empty() || input.empty()) {
        std::cerr << "Error: Missing file or input." << std::endl;
        return 1;
    }

    bool result = false;
    if (filename.find(".pda") != std::string::npos) {
        PDA pda;
        try {
            pda = PDAParser(filename);
        } catch (SyntaxError& e) {
            std::cerr << e.what() << std::endl;
            exit(1);
        }
        try {
            result = pda.simulater(input);
        } catch (IllegalInput& e) {
            std::cerr << e.what() << std::endl;
            exit(1);
        }
        std::cout << (result ? "true" : "false") << std::endl;
    } else if (filename.find(".tm") != std::string::npos) {
        TM tm;
        try {
            tm = TMParser(filename);
        } catch (SyntaxError& e) {
            std::cerr << e.what() << std::endl;
            exit(1);
        }
        if (verbose) {
            tm.setVerbose(true);
        }
        result = tm.simulater(input);
        if (result) {
            tm.printResult();
        }
        
    } else {
        std::cerr << "Error: Invalid file type." << std::endl;
        return 1;
    }

    return 0;
}