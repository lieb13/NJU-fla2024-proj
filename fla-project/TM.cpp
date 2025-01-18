#include "TM.h"

void TM::printVerboseInfo(int step){
    std::cout << "Step   : " << step << std::endl;
    std::cout << "State  : " << current_state_ << std::endl;
    for (int i = 0; i < tape_count_; i++){
        std::string Index = "", Tape = "", Head = "";
        int st = 0, ed = tapes_[i].size() - 1;
        while (tapes_[i][st] == BLANK && st < tape_heads_[i]) st++;
        while (tapes_[i][ed] == BLANK && ed > tape_heads_[i]) ed--;
        for (int j = st; j <= ed; j++) {
            std::string index = std::to_string(std::abs(j - offset_[i]));
            Index += index + " ";
            Tape += tapes_[i][j] + std::string(index.length(), ' ');
            Head += (j == tape_heads_[i] ? "^" : " ") + std::string(index.length(), ' ');
        }
        std::cout << "Index" << i << " : " << Index << std::endl;
        std::cout << "Tape" << i << "  : " << Tape << std::endl;
        std::cout << "Head" << i << "  : " << Head << std::endl;
    }
    std::cout << LINE;
}

void TM::initialize_(std::string input) {
    current_state_ = start_state_;
    if (verbose_) {
        std::cout << "Input: " << input << std::endl;
    }
    for (int i = 0; i < input.size(); i++){
        char symbol = input[i];
        try {
            checkInputSymbol(symbol);
        } catch (IllegalInput& e) {
            if (verbose_) {
                std::cerr << ERR << "error: '" << symbol << "' was not declared in the set of input symbols\n"  \
                    << "Input: " << input << std::endl << positionPointer(7+i, "") << END;
            }
            else {
                std::cerr << e.what() << std::endl;
            }
            exit(1);
        }
    }
    tapes_.resize(tape_count_);
    tape_heads_.resize(tape_count_, 0);
    offset_.resize(tape_count_, 0);
    for (int i = 1; i < tape_count_; i++){
        tapes_[i].push_back(BLANK);
    }
    for (char symbol : input){
        tapes_[0].push_back(symbol);
    }

    if (verbose_) {
        std::cout << RUN;
        printVerboseInfo(0);
    }
}

bool TM::simulater(const std::string& input) {
    initialize_(input);
    int step = 0;
    while (transition_()){
        // return false;
        // verbose_ = true;
        step++;
        if (verbose_){
            printVerboseInfo(step);
        }

    }
    return final_states_.find(current_state_) != final_states_.end();
}

void TM::printResult(){
    std::string result = "";
    int it = 0;
    while (tapes_[0][it] == BLANK){
        it++;
    }
    while (it < tapes_[0].size()){
        result += (tapes_[0][it] == BLANK ? ' ' : tapes_[0][it]);
        it++;
    }
    while (result.back() == ' '){
        result.pop_back();
    }
    if (verbose_) {
        std::cout << "Result: " << result << std::endl << END;
    }
    else {
        std::cout << result << std::endl;
    }
}

std::vector<InOutPair> TM::expandSymbolGroup_(const InOutPair& inOutPair) {
    std::vector<InOutPair> result = {};
    result.push_back(std::make_pair("","")); // 初始为空

    // std::cerr << inOutPair.first << " " << inOutPair.second << std::endl;
    for (int i = 0; i < inOutPair.first.size(); i++) {
        char in = inOutPair.first[i];
        char out = inOutPair.second[i];
        std::vector<InOutPair> newResult = {};
        for (const auto& prefix : result) {
            if (in == ANY && out == ANY) {
                for (char symbol : tape_symbols_) {
                    if (symbol != BLANK) {
                        newResult.push_back(std::make_pair(prefix.first + symbol,\
                            prefix.second + symbol));
                    }
                }
            }
            else if (in == ANY && out != ANY) {
                for (char symbol : tape_symbols_) {
                    if (symbol != BLANK) {
                        newResult.push_back(std::make_pair(prefix.first + symbol,\
                        prefix.second + out));
                    }
                }
            }
            else if (in != ANY && out == ANY) {
                throw SyntaxError("Invalid transition format");
            }
            else {
                newResult.push_back(std::make_pair(prefix.first + in,\
                    prefix.second + out));
            }
        }
        result = newResult;
    }

    return result;
}

void TM::addTransition(const State& from, const std::string& input, \
        const std::string& output, const std::string& direction, const State& to){
    if (input.length() != tape_count_ || direction.length() != tape_count_ || \
        output.length() != tape_count_){
        throw SyntaxError("Invalid transition format");
    }
    for (int i = 0; i < tape_count_; i++){
        checkTapeSymbol(input[i]);
        checkTapeSymbol(output[i]);
        checkDirection(direction[i]);
    }

    auto inOutPairs = expandSymbolGroup_(std::make_pair(input, output));
    for (const auto& inOutPair : inOutPairs) {
        transitions_[{from, inOutPair.first}] = {to, inOutPair.second, direction};
    }
}    

bool TM::transition_(){ 
    std::string input = "";
    for (int i = 0; i < tape_count_; i++){
        if (tape_heads_[i] < tapes_[i].size()){
            input += tapes_[i][tape_heads_[i]];
        }
        else{
            input += BLANK;
        }
    }

    auto key = std::make_tuple(current_state_, input);
    if (transitions_.find(key) != transitions_.end()){
        State new_state; std::string output; std::string direction;
        std::tie(new_state, output, direction) = transitions_[key];
        current_state_ = new_state;
        for (int i = 0; i < tape_count_; i++){
            tapes_[i][tape_heads_[i]] = output[i];
            if (direction[i] == LEFT){
                if (tape_heads_[i] == 0) {
                    tapes_[i].push_front(BLANK);
                    offset_[i]++;
                }
                else {
                    tape_heads_[i] -= 1;
                }
                // while (tapes_[i].back() == BLANK && tapes_[i].size() > 1){
                //     tapes_[i].pop_back();
                // }
            }
            else if (direction[i] == RIGHT){
                if (tape_heads_[i] == tapes_[i].size() - 1){
                    tapes_[i].push_back(BLANK);
                }
                tape_heads_[i] += 1;
                // while (tapes_[i].front() == BLANK && tapes_[i].size() > 1){
                //     tapes_[i].pop_front();
                //     tape_heads_[i] -= 1;
                // }
            }
        }
        return true;
    }
    return false;
}