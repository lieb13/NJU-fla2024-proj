#pragma once

#include "exception.h"
#include "Automation.h"

class TM : public Automation{
private:
    std::set<Symbol> tape_symbols_;
    std::map<std::tuple<State, std::string>, \
        std::tuple<State, std::string, std::string>> transitions_;
    std::vector<std::deque<Symbol>> tapes_ {};
    std::vector<int> tape_heads_ {};
    int tape_count_ = 0;
    bool verbose_ = false;
    std::vector<int> offset_ {};

    void initialize_(std::string input);
    bool transition_();
    std::vector<InOutPair> expandSymbolGroup_(const InOutPair& inOutPair);
    void printVerboseInfo(int step);
public:
    void printResult();

    void addTransition(const State& from, const std::string& input, \
            const std::string& output, const std::string& direction, const State& to);

    bool simulater(const std::string& input);

    void addTapeSymbol(Symbol symbol) {
        tape_symbols_.insert(symbol);
    }
    void addTapeSymbols(const std::set<Symbol>& symbols) {
        tape_symbols_.insert(symbols.begin(), symbols.end());
    }
    std::set<Symbol> getTapeSymbols() {
        return tape_symbols_;
    }

    void setTapeCount(int count) {
        tape_count_ = count;
    }
    int getTapeCount() {
        return tape_count_;
    }

    void setVerbose(bool verbose) {
        verbose_ = verbose;
    }

    inline void checkTapeSymbol(Symbol symbol) {
        if (symbol != ANY && tape_symbols_.find(symbol) == tape_symbols_.end()) {
            throw IllegalInput("Tape symbol not found");
        }
    }

    inline void checkDirection(Direction direction) {
        if (direction != LEFT && direction != RIGHT && direction != ANY) {
            throw IllegalInput("Direction must be 'l', 'r' or '*'");
        }
    }
};
