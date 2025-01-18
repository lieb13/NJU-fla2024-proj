#pragma once

#include "PDA.h"
#include "TM.h"

std::set<State> readState(std::istringstream& iss);

std::set<Symbol> readSymbol(std::istringstream& iss);

PDA PDAParser(const std::string& filename);

TM TMParser(const std::string& filename);