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
CMAKE_SOURCE_DIR = /home/parallels/Desktop/llvm/learn/testIR

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/Desktop/llvm/learn/testIR/build

# Include any dependencies generated for this target.
include CMakeFiles/handle.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/handle.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/handle.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/handle.dir/flags.make

CMakeFiles/handle.dir/handle.o: CMakeFiles/handle.dir/flags.make
CMakeFiles/handle.dir/handle.o: /home/parallels/Desktop/llvm/learn/testIR/handle.cpp
CMakeFiles/handle.dir/handle.o: CMakeFiles/handle.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/parallels/Desktop/llvm/learn/testIR/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/handle.dir/handle.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/handle.dir/handle.o -MF CMakeFiles/handle.dir/handle.o.d -o CMakeFiles/handle.dir/handle.o -c /home/parallels/Desktop/llvm/learn/testIR/handle.cpp

CMakeFiles/handle.dir/handle.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/handle.dir/handle.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/parallels/Desktop/llvm/learn/testIR/handle.cpp > CMakeFiles/handle.dir/handle.i

CMakeFiles/handle.dir/handle.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/handle.dir/handle.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/parallels/Desktop/llvm/learn/testIR/handle.cpp -o CMakeFiles/handle.dir/handle.s

# Object files for target handle
handle_OBJECTS = \
"CMakeFiles/handle.dir/handle.o"

# External object files for target handle
handle_EXTERNAL_OBJECTS =

handle: CMakeFiles/handle.dir/handle.o
handle: CMakeFiles/handle.dir/build.make
handle: /usr/lib/llvm-13/lib/libLLVMSupport.a
handle: /usr/lib/llvm-13/lib/libLLVMCore.a
handle: /usr/lib/llvm-13/lib/libLLVMIRReader.a
handle: /usr/lib/llvm-13/lib/libLLVMAnalysis.a
handle: /usr/lib/llvm-13/lib/libLLVMAsmParser.a
handle: /usr/lib/llvm-13/lib/libLLVMObject.a
handle: /usr/lib/llvm-13/lib/libLLVMBitReader.a
handle: /usr/lib/llvm-13/lib/libLLVMMCParser.a
handle: /usr/lib/llvm-13/lib/libLLVMMC.a
handle: /usr/lib/llvm-13/lib/libLLVMDebugInfoCodeView.a
handle: /usr/lib/llvm-13/lib/libLLVMTextAPI.a
handle: /usr/lib/llvm-13/lib/libLLVMProfileData.a
handle: /usr/lib/llvm-13/lib/libLLVMCore.a
handle: /usr/lib/llvm-13/lib/libLLVMBinaryFormat.a
handle: /usr/lib/llvm-13/lib/libLLVMRemarks.a
handle: /usr/lib/llvm-13/lib/libLLVMBitstreamReader.a
handle: /usr/lib/llvm-13/lib/libLLVMSupport.a
handle: /usr/lib/aarch64-linux-gnu/libz3.so
handle: /usr/lib/aarch64-linux-gnu/libz.so
handle: /usr/lib/aarch64-linux-gnu/libtinfo.so
handle: /usr/lib/llvm-13/lib/libLLVMDemangle.a
handle: CMakeFiles/handle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/parallels/Desktop/llvm/learn/testIR/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable handle"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/handle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/handle.dir/build: handle
.PHONY : CMakeFiles/handle.dir/build

CMakeFiles/handle.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/handle.dir/cmake_clean.cmake
.PHONY : CMakeFiles/handle.dir/clean

CMakeFiles/handle.dir/depend:
	cd /home/parallels/Desktop/llvm/learn/testIR/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/Desktop/llvm/learn/testIR /home/parallels/Desktop/llvm/learn/testIR /home/parallels/Desktop/llvm/learn/testIR/build /home/parallels/Desktop/llvm/learn/testIR/build /home/parallels/Desktop/llvm/learn/testIR/build/CMakeFiles/handle.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/handle.dir/depend
