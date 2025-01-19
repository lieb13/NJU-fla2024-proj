#include "PDA.h"

void PDA::printResult(bool result) {
    if (verbose_) {
        std::cout << "Result : " << (result ? "true\n" : "false\n") << END << std::endl;
    }
    else {
        std::cout << (result ? "true" : "false") << std::endl;
    }
}

void PDA::printVerboseInfo(Symbol input, Symbol pop, std::string push) {
    std::cout << "Step   : " << step_ << std::endl;
    std::cout << "State  : " << current_state_ << std::endl;
    if (pop == EPSION) {
        std::cout << LINE;
        return;    
    }
    std::cout << "Read   : " << input << std::endl;
    std::cout << "Pop    : " << pop << std::endl;
    std::cout << "Push   : " << push << std::endl;
    std::cout << LINE;
}

bool PDA::simulater(const std::string& input) {
    current_state_ = start_state_;
    stack_ = std::stack<Symbol>();
    stack_.push(initial_stack_symbol_);

    for (int i = 0; i < input.size(); i++) {
        char symbol = input[i];
        try {
            checkInputSymbol(symbol);
        } catch (IllegalInput& e) {
            if (verbose_) {
                std::cout << "Input: " << input << std::endl;
                std::cerr << ERR << "error: '" << symbol << "' was not declared in the set of input symbols\n"  \
                    << "Input: " << input << std::endl << positionPointer(7+i, "") << END;
                exit(1);
            }
            else {
                std::cerr << "illegal input" << std::endl;
            }
            exit(1);
        }
    }
    if (verbose_) {
        std::cout << "Input: " << input << std::endl << RUN;
        printVerboseInfo(EPSION, EPSION, "");
    }

    bool result = true;
    for (char symbol : input) {
        if (!transition_(symbol)) {
            return false;
        }
    }

    auto empty_key = std::make_tuple(current_state_, EPSION, stack_.top());
    while (transitions_.find(empty_key) != transitions_.end()) {
        // auto [new_state, stack_push] = transitions_[empty_key];
        State new_state; StackString stack_push;
        std::tie(new_state, stack_push) = transitions_[empty_key];

        stack_.pop();
        for (auto it = stack_push.rbegin(); it != stack_push.rend(); ++it) {
            stack_.push(*it);
        }
        current_state_ = new_state;
        if (stack_.empty()) {
            break;
        }
        empty_key = std::make_tuple(current_state_, EPSION, stack_.top());
    }

    return final_states_.find(current_state_) != final_states_.end();
}

void PDA::addTransition(const State& from, const Symbol& input, \
        const Symbol& stackTop, const State& to, StackString& stackPush) {
    if (stackPush[0] == EPSION) {
        stackPush = "";
    }
    for (char symbol : stackPush) {
        checkStackSymbol(symbol);
    }
    checkState(from); checkState(to); checkInputSymbol(input); checkStackSymbol(stackTop);

    transitions_[{from, input, stackTop}] = {to, stackPush};
}

bool PDA::transition_(Symbol input) {
    if(stack_.empty()) {
        return false;
    }

    auto empty_key = std::make_tuple(current_state_, EPSION, stack_.top());
    while (transitions_.find(empty_key) != transitions_.end()) {
        // auto [new_state, stack_push] = transitions_[empty_key];
        State new_state; StackString stack_push;
        std::tie(new_state, stack_push) = transitions_[empty_key];
        if (verbose_) {
            step_++;
            printVerboseInfo(EPSION, stack_.top(), stack_push);
        }
        stack_.pop();
        for (auto it = stack_push.rbegin(); it != stack_push.rend(); ++it) {
            stack_.push(*it);
        }
        current_state_ = new_state;
        if (stack_.empty()) {
            return false;
        }
        empty_key = std::make_tuple(current_state_, EPSION, stack_.top());
    }

    auto key = std::make_tuple(current_state_, input, stack_.top());
    if (transitions_.find(key) != transitions_.end()) {
        // auto [new_state, stack_push] = transitions_[key];
        State new_state; StackString stack_push;
        std::tie(new_state, stack_push) = transitions_[key];
        if (verbose_) {
            step_++;
            printVerboseInfo(input, stack_.top(), stack_push);
        }
        stack_.pop();
        for (auto it = stack_push.rbegin(); it != stack_push.rend(); ++it) {
            stack_.push(*it);
        }
        current_state_ = new_state;
        return true;
    }
    else {
        return false;
    }
}