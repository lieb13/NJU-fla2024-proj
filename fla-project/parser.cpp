#include <iostream>
#include <fstream>
#include <sstream>
#include "parser.h"
#include "PDA.h"
#include "TM.h"
#include "exception.h"
using namespace std;

std::set<State> readState(std::istringstream& iss) {
    std::string state;
    bool started = false;
    char ch;
    std::set<State> states;
    while (iss >> ch) {
        switch (ch) {
            case '{' :
                if (!started) {
                    state = "";
                    started = true;
                }
                else {
                    throw SyntaxError(": too many '{'");
                }
                break;
            case ',' :
                if (started) {
                    states.insert(state);
                    state = "";
                }
                break;
            case '}' :
                if (started) {
                    states.insert(state);
                    state = "";
                    started = false;
                }
                break;
            default:
                if (started) state += ch;
                break;
        }
    }
    return states;
}

std::set<Symbol> readSymbol(std::istringstream& iss) {
    bool started = false;
    char ch;
    char symbol = '\0';
    std::set<Symbol> symbols;
    while (iss >> ch) {
        switch (ch) {
            case '{' :
                if (!started) {
                    started = true;
                    symbol = '\0';
                }
                else {
                    throw SyntaxError(": too many '{'");
                }
                break;
            case ',' :
                if (started) {
                    symbols.insert(symbol);
                    symbol = '\0';
                }
                break;
            case '}' :
                if (started) {
                    symbols.insert(symbol);
                    symbol = '\0';
                    started = false;
                }
                break;
            default:
                if (started) {
                    if (symbol == '\0') {
                        symbol = ch;
                    }
                    else {
                        throw SyntaxError(": need '{");
                    }
                }
                break;
        }
    }
    return symbols;
}

PDA PDAParser(const std::string& filename) {
    PDA pda;
    std::ifstream file(filename);
    std::string line;
    int Q = 0, S = 0, G = 0, q0 = 0, z0 = 0, F = 0;
    while (std::getline(file, line)) {

        if (line.empty() || line[0] == ';') {
            continue;
        }
        else if (line[0] == '#') {
            std::istringstream iss(line.substr(1));
            std::string key;
            iss >> key;
            char equal_sign;
            iss >> equal_sign;
            if (equal_sign != '=') {
                throw SyntaxError(": need '='");
            }
            if (key == "Q") {
                Q++;
                pda.addStates(readState(iss));
            } 
            else if (key == "S") {
                S++;
                pda.addInputSymbols(readSymbol(iss));
            } 
            else if (key == "G") {
                G++;
                pda.addStackSymbols(readSymbol(iss));
            } 
            else if (key == "q0") {
                q0++;
                State state;
                iss >> state;
                pda.checkState(state);
                pda.setStartState(state);
            } 
            else if (key == "z0") {
                z0++;
                Symbol symbol;
                iss >> symbol;
                pda.checkStackSymbol(symbol);
                pda.setStartStackSymbol(symbol);
            } 
            else if (key == "F") {
                F++;
                pda.addFinalStates(readState(iss));
                for (auto state : pda.getFinalStates()) {
                    pda.checkState(state);
                }
            }
            else {
                throw SyntaxError(": wrong key after '#'");
            }
        } 
        else { 
            if (Q != 1 || S != 1 || G != 1 || q0 != 1 || z0 != 1 || F != 1) {
                throw SyntaxError(": missing element or input some elements more than once");
            }
            std::istringstream iss(line);
            State from, to;
            Symbol input, stackTop;
            std::string stackPush;

            iss >> from >> input >> stackTop >> to >> stackPush;
            pda.addTransition(from, input, stackTop, to, stackPush);
        }
    }

    return pda;
}

TM TMParser(const std::string& filename) {
    TM tm;
    std::ifstream file(filename);
    std::string line;

    int Q = 0, S = 0, G = 0, q0 = 0, B = 0, F = 0, N = 0;
    while (std::getline(file, line)) {

        if (line.empty() || line[0] == ';') {
            continue;
        }
        else if (line[0] == '#') {
            std::istringstream iss(line.substr(1));
            std::string key;
            iss >> key;
            char equal_sign;
            iss >> equal_sign;
            if (equal_sign != '=') {
                throw SyntaxError(": need '='");
            }
            if (key == "Q") {
                Q++;
                tm.addStates(readState(iss));
            } 
            else if (key == "S") {
                S++;
                tm.addInputSymbols(readSymbol(iss));
            } 
            else if (key == "G") {
                G++;
                tm.addTapeSymbols(readSymbol(iss));
            } 
            else if (key == "q0") {
                q0++;
                State state;
                iss >> state;
                tm.checkState(state);
                tm.setStartState(state);
            } 
            else if (key == "B") {
                B++;
                Symbol blank;
                iss >> blank;
                if (blank != BLANK) {
                    throw SyntaxError(": invalid blank symbol");
                }
            }
            else if (key == "F") {
                F++;
                tm.addFinalStates(readState(iss));
                for (auto state : tm.getFinalStates()) {
                    tm.checkState(state);
                }
            }
            else if (key == "N") {
                N++;
                int count;
                iss >> count;
                tm.setTapeCount(count);
            }
        }
        else {
            if (Q != 1 || S != 1 || G != 1 || q0 != 1 || B != 1 || F != 1 || N != 1) {
                throw SyntaxError(": missing element or input some elements more than once");
            }
            std::istringstream iss(line);
            State from, to;
            std::string input, output, direction;

            iss >> from >> input >> output >> direction >> to;
            tm.addTransition(from, input, output, direction, to);
        }
    }

    return tm;
}