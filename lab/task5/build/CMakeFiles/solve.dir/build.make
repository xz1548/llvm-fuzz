# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/parallels/Desktop/llvm/lab/task5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/Desktop/llvm/lab/task5/build

# Include any dependencies generated for this target.
include CMakeFiles/solve.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/solve.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/solve.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/solve.dir/flags.make

CMakeFiles/solve.dir/solve.o: CMakeFiles/solve.dir/flags.make
CMakeFiles/solve.dir/solve.o: /home/parallels/Desktop/llvm/lab/task5/solve.cpp
CMakeFiles/solve.dir/solve.o: CMakeFiles/solve.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/parallels/Desktop/llvm/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/solve.dir/solve.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/solve.dir/solve.o -MF CMakeFiles/solve.dir/solve.o.d -o CMakeFiles/solve.dir/solve.o -c /home/parallels/Desktop/llvm/lab/task5/solve.cpp

CMakeFiles/solve.dir/solve.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/solve.dir/solve.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/Desktop/llvm/lab/task5/solve.cpp > CMakeFiles/solve.dir/solve.i

CMakeFiles/solve.dir/solve.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/solve.dir/solve.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/Desktop/llvm/lab/task5/solve.cpp -o CMakeFiles/solve.dir/solve.s

# Object files for target solve
solve_OBJECTS = \
"CMakeFiles/solve.dir/solve.o"

# External object files for target solve
solve_EXTERNAL_OBJECTS =

solve: CMakeFiles/solve.dir/solve.o
solve: CMakeFiles/solve.dir/build.make
solve: /usr/lib/llvm-11/lib/libLLVMSupport.a
solve: /usr/lib/llvm-11/lib/libLLVMCore.a
solve: /usr/lib/llvm-11/lib/libLLVMIRReader.a
solve: /usr/lib/llvm-11/lib/libLLVMAnalysis.a
solve: /usr/lib/llvm-11/lib/libLLVMTransformUtils.a
solve: /usr/lib/llvm-11/lib/libLLVMAsmParser.a
solve: /usr/lib/llvm-11/lib/libLLVMAnalysis.a
solve: /usr/lib/llvm-11/lib/libLLVMObject.a
solve: /usr/lib/llvm-11/lib/libLLVMBitReader.a
solve: /usr/lib/llvm-11/lib/libLLVMMCParser.a
solve: /usr/lib/llvm-11/lib/libLLVMMC.a
solve: /usr/lib/llvm-11/lib/libLLVMDebugInfoCodeView.a
solve: /usr/lib/llvm-11/lib/libLLVMDebugInfoMSF.a
solve: /usr/lib/llvm-11/lib/libLLVMTextAPI.a
solve: /usr/lib/llvm-11/lib/libLLVMProfileData.a
solve: /usr/lib/llvm-11/lib/libLLVMCore.a
solve: /usr/lib/llvm-11/lib/libLLVMBinaryFormat.a
solve: /usr/lib/llvm-11/lib/libLLVMRemarks.a
solve: /usr/lib/llvm-11/lib/libLLVMBitstreamReader.a
solve: /usr/lib/llvm-11/lib/libLLVMSupport.a
solve: /usr/lib/aarch64-linux-gnu/libz3.so
solve: /usr/lib/llvm-11/lib/libLLVMDemangle.a
solve: CMakeFiles/solve.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/parallels/Desktop/llvm/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable solve"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/solve.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/solve.dir/build: solve
.PHONY : CMakeFiles/solve.dir/build

CMakeFiles/solve.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/solve.dir/cmake_clean.cmake
.PHONY : CMakeFiles/solve.dir/clean

CMakeFiles/solve.dir/depend:
	cd /home/parallels/Desktop/llvm/lab/task5/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/Desktop/llvm/lab/task5 /home/parallels/Desktop/llvm/lab/task5 /home/parallels/Desktop/llvm/lab/task5/build /home/parallels/Desktop/llvm/lab/task5/build /home/parallels/Desktop/llvm/lab/task5/build/CMakeFiles/solve.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/solve.dir/depend
