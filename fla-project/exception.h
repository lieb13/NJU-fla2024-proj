#pragma once

#include <iostream>
#include <stdexcept>
#include <string>

#define ERR "==================== ERR ====================\n"
#define RUN "==================== RUN ====================\n"
#define END "==================== END ====================\n"
#define LINE "---------------------------------------------\n"

static std::string positionPointer(int pos, const std::string& msg){
    std::string result = "";
    for (int i = 0; i < pos; i++){
        result += " ";
    }
    result += "^\n";
    return result;
}

class SyntaxError : public std::exception {
private:
    std::string message;

public:
    SyntaxError(const std::string& msg) : message(msg) {}

    const char* what() const noexcept override {
        return message.c_str();
    }
};

class IllegalInput : public std::exception {
private:
    std::string message;

public:
    IllegalInput(const std::string& msg) : message(msg) {}

    const char* what() const noexcept override {
        return message.c_str();
    }
};

class MyException : public IllegalInput , public SyntaxError {
public:
    MyException(const std::string& msg) : IllegalInput(msg), SyntaxError(msg) {}
};
