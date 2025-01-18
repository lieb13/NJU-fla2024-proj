#pragma once

#include "exception.h"
#include "Automation.h"

class PDA : public Automation{

private:
    std::set<Symbol> stack_symbols_;
    Symbol initial_stack_symbol_ = '\0';
    std::map<std::tuple<State, Symbol, Symbol>, \
        std::tuple<State, StackString>> transitions_;
    std::stack<Symbol> stack_ {};

    bool transition_(Symbol input);

public:
    void addTransition(const State& from, const Symbol& input, \
        const Symbol& stackTop, const State& to, StackString& stackPush);

    bool simulater(const std::string& input) ;

    void addStackSymbol(Symbol symbol) {
        stack_symbols_.insert(symbol);
    }
    void addStackSymbols(const std::set<Symbol>& symbols) {
        stack_symbols_.insert(symbols.begin(), symbols.end());
    }
    std::set<Symbol> getStackSymbols() {
        return stack_symbols_;
    }

    void setStartStackSymbol(Symbol symbol) {
        initial_stack_symbol_ = symbol;
    }
    Symbol getStartStackSymbol() {
        return initial_stack_symbol_;
    }

    inline void checkStackSymbol(Symbol symbol) {
        if (stack_symbols_.find(symbol) == stack_symbols_.end()) {
            throw IllegalInput("");
        }
    }

};