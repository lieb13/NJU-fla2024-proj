# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "E:\Program Files\Git\mingw64\bin\cmake.exe"

# The command to remove a file.
RM = "E:\Program Files\Git\mingw64\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "E:\nju\2024Autumn\Formal Languages and Automata\project-2024"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build"

# Include any dependencies generated for this target.
include CMakeFiles/fla.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/fla.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/fla.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fla.dir/flags.make

CMakeFiles/fla.dir/fla-project/PDA.cpp.obj: CMakeFiles/fla.dir/flags.make
CMakeFiles/fla.dir/fla-project/PDA.cpp.obj: CMakeFiles/fla.dir/includes_CXX.rsp
CMakeFiles/fla.dir/fla-project/PDA.cpp.obj: E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/fla-project/PDA.cpp
CMakeFiles/fla.dir/fla-project/PDA.cpp.obj: CMakeFiles/fla.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/fla.dir/fla-project/PDA.cpp.obj"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/fla.dir/fla-project/PDA.cpp.obj -MF CMakeFiles\fla.dir\fla-project\PDA.cpp.obj.d -o CMakeFiles\fla.dir\fla-project\PDA.cpp.obj -c "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\PDA.cpp"

CMakeFiles/fla.dir/fla-project/PDA.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fla.dir/fla-project/PDA.cpp.i"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\PDA.cpp" > CMakeFiles\fla.dir\fla-project\PDA.cpp.i

CMakeFiles/fla.dir/fla-project/PDA.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fla.dir/fla-project/PDA.cpp.s"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\PDA.cpp" -o CMakeFiles\fla.dir\fla-project\PDA.cpp.s

CMakeFiles/fla.dir/fla-project/TM.cpp.obj: CMakeFiles/fla.dir/flags.make
CMakeFiles/fla.dir/fla-project/TM.cpp.obj: CMakeFiles/fla.dir/includes_CXX.rsp
CMakeFiles/fla.dir/fla-project/TM.cpp.obj: E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/fla-project/TM.cpp
CMakeFiles/fla.dir/fla-project/TM.cpp.obj: CMakeFiles/fla.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/fla.dir/fla-project/TM.cpp.obj"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/fla.dir/fla-project/TM.cpp.obj -MF CMakeFiles\fla.dir\fla-project\TM.cpp.obj.d -o CMakeFiles\fla.dir\fla-project\TM.cpp.obj -c "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\TM.cpp"

CMakeFiles/fla.dir/fla-project/TM.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fla.dir/fla-project/TM.cpp.i"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\TM.cpp" > CMakeFiles\fla.dir\fla-project\TM.cpp.i

CMakeFiles/fla.dir/fla-project/TM.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fla.dir/fla-project/TM.cpp.s"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\TM.cpp" -o CMakeFiles\fla.dir\fla-project\TM.cpp.s

CMakeFiles/fla.dir/fla-project/main.cpp.obj: CMakeFiles/fla.dir/flags.make
CMakeFiles/fla.dir/fla-project/main.cpp.obj: CMakeFiles/fla.dir/includes_CXX.rsp
CMakeFiles/fla.dir/fla-project/main.cpp.obj: E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/fla-project/main.cpp
CMakeFiles/fla.dir/fla-project/main.cpp.obj: CMakeFiles/fla.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/fla.dir/fla-project/main.cpp.obj"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/fla.dir/fla-project/main.cpp.obj -MF CMakeFiles\fla.dir\fla-project\main.cpp.obj.d -o CMakeFiles\fla.dir\fla-project\main.cpp.obj -c "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\main.cpp"

CMakeFiles/fla.dir/fla-project/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fla.dir/fla-project/main.cpp.i"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\main.cpp" > CMakeFiles\fla.dir\fla-project\main.cpp.i

CMakeFiles/fla.dir/fla-project/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fla.dir/fla-project/main.cpp.s"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\main.cpp" -o CMakeFiles\fla.dir\fla-project\main.cpp.s

CMakeFiles/fla.dir/fla-project/parser.cpp.obj: CMakeFiles/fla.dir/flags.make
CMakeFiles/fla.dir/fla-project/parser.cpp.obj: CMakeFiles/fla.dir/includes_CXX.rsp
CMakeFiles/fla.dir/fla-project/parser.cpp.obj: E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/fla-project/parser.cpp
CMakeFiles/fla.dir/fla-project/parser.cpp.obj: CMakeFiles/fla.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/fla.dir/fla-project/parser.cpp.obj"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/fla.dir/fla-project/parser.cpp.obj -MF CMakeFiles\fla.dir\fla-project\parser.cpp.obj.d -o CMakeFiles\fla.dir\fla-project\parser.cpp.obj -c "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\parser.cpp"

CMakeFiles/fla.dir/fla-project/parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fla.dir/fla-project/parser.cpp.i"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\parser.cpp" > CMakeFiles\fla.dir\fla-project\parser.cpp.i

CMakeFiles/fla.dir/fla-project/parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fla.dir/fla-project/parser.cpp.s"
	D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\fla-project\parser.cpp" -o CMakeFiles\fla.dir\fla-project\parser.cpp.s

# Object files for target fla
fla_OBJECTS = \
"CMakeFiles/fla.dir/fla-project/PDA.cpp.obj" \
"CMakeFiles/fla.dir/fla-project/TM.cpp.obj" \
"CMakeFiles/fla.dir/fla-project/main.cpp.obj" \
"CMakeFiles/fla.dir/fla-project/parser.cpp.obj"

# External object files for target fla
fla_EXTERNAL_OBJECTS =

E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/fla-project/PDA.cpp.obj
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/fla-project/TM.cpp.obj
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/fla-project/main.cpp.obj
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/fla-project/parser.cpp.obj
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/build.make
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/linkLibs.rsp
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/objects1.rsp
E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe: CMakeFiles/fla.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable \"E:\nju\2024Autumn\Formal Languages and Automata\project-2024\bin\fla.exe\""
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\fla.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fla.dir/build: E:/nju/2024Autumn/Formal\ Languages\ and\ Automata/project-2024/bin/fla.exe
.PHONY : CMakeFiles/fla.dir/build

CMakeFiles/fla.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\fla.dir\cmake_clean.cmake
.PHONY : CMakeFiles/fla.dir/clean

CMakeFiles/fla.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "E:\nju\2024Autumn\Formal Languages and Automata\project-2024" "E:\nju\2024Autumn\Formal Languages and Automata\project-2024" "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build" "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build" "E:\nju\2024Autumn\Formal Languages and Automata\project-2024\build\CMakeFiles\fla.dir\DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/fla.dir/depend

