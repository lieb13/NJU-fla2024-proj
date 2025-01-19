#pragma once

#include <iostream>
#include <stack>
#include <string>
#include <unordered_map>
#include <map>
#include <vector>
#include <functional>
#include <set>
#include <tuple>

#include "exception.h"

#define EPSION ('_')

using State = std::string;
using Symbol = char;
using StackString = std::string;

using Direction = char;
#define BLANK ('_')
#define ANY ('*')
#define LEFT ('l')
#define RIGHT ('r')
using InOutPair = std::pair<std::string, std::string>;

class Automation {

protected:
    std::set<State> states_ {};
    std::set<Symbol> input_symbols_ {};
    State start_state_ = "";
    State current_state_ {};
    std::set<State> final_states_ {};
    
    bool verbose_ = false;
    
    // virtual void initialize() = 0;
public:

    // virtual ~Automation() = default;

    // virtual bool simulater(const std::string& input) = 0;

    void setVerbose(bool verbose) {
        verbose_ = verbose;
    }
    void addState(const State& state) {
        states_.insert(state);
    }
    void addStates(const std::set<State>& states) {
        states_.insert(states.begin(), states.end());
    }
    std::set<State> getStates() {
        return states_;
    }

    void addInputSymbol(Symbol symbol) {
        input_symbols_.insert(symbol);
    }
    void addInputSymbols(const std::set<Symbol>& symbols) {
        input_symbols_.insert(symbols.begin(), symbols.end());
    }
    std::set<Symbol> getInputSymbols() {
        return input_symbols_;
    }

    void setStartState(const State& state) {
        start_state_ = state;
        // current_state_ = state;
    }
    State getStartState() {
        return start_state_;
    }

    void addFinalState(const State& state) {
        final_states_.insert(state);
    }
    void addFinalStates(const std::set<State>& states) {
        final_states_.insert(states.begin(), states.end());
    }
    std::set<State> getFinalStates() {
        return final_states_;
    }

    // void reset(State start_state) {
    //     current_state_ = start_state;
    // }

    inline void checkInputSymbol(Symbol symbol) {
        if (symbol != EPSION && input_symbols_.find(symbol) == input_symbols_.end()) {
            throw MyException(": invalid input symbol");
        }
    }
    inline void checkState(State state) {
        if (states_.find(state) == states_.end()) {
            throw MyException(": invalid state");
        }
    }

};