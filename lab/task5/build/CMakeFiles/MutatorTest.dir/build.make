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
CMAKE_SOURCE_DIR = /home/kali/Desktop/llvm-fuzz/lab/task5

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kali/Desktop/llvm-fuzz/lab/task5/build

# Include any dependencies generated for this target.
include CMakeFiles/MutatorTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MutatorTest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MutatorTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MutatorTest.dir/flags.make

CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o: CMakeFiles/MutatorTest.dir/flags.make
CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/test/MutatorTest.cpp
CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o: CMakeFiles/MutatorTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o -MF CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o.d -o CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/test/MutatorTest.cpp

CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/test/MutatorTest.cpp > CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.i

CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/test/MutatorTest.cpp -o CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.s

CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o: CMakeFiles/MutatorTest.dir/flags.make
CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp
CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o: CMakeFiles/MutatorTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o -MF CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o.d -o CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp

CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp > CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.i

CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp -o CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.s

CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o: CMakeFiles/MutatorTest.dir/flags.make
CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp
CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o: CMakeFiles/MutatorTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o -MF CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o.d -o CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp

CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp > CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.i

CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp -o CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.s

CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o: CMakeFiles/MutatorTest.dir/flags.make
CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp
CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o: CMakeFiles/MutatorTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o -MF CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o.d -o CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp

CMakeFiles/MutatorTest.dir/src/Mutator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MutatorTest.dir/src/Mutator.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp > CMakeFiles/MutatorTest.dir/src/Mutator.cpp.i

CMakeFiles/MutatorTest.dir/src/Mutator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MutatorTest.dir/src/Mutator.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp -o CMakeFiles/MutatorTest.dir/src/Mutator.cpp.s

CMakeFiles/MutatorTest.dir/src/Target.cpp.o: CMakeFiles/MutatorTest.dir/flags.make
CMakeFiles/MutatorTest.dir/src/Target.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp
CMakeFiles/MutatorTest.dir/src/Target.cpp.o: CMakeFiles/MutatorTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/MutatorTest.dir/src/Target.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MutatorTest.dir/src/Target.cpp.o -MF CMakeFiles/MutatorTest.dir/src/Target.cpp.o.d -o CMakeFiles/MutatorTest.dir/src/Target.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp

CMakeFiles/MutatorTest.dir/src/Target.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MutatorTest.dir/src/Target.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp > CMakeFiles/MutatorTest.dir/src/Target.cpp.i

CMakeFiles/MutatorTest.dir/src/Target.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MutatorTest.dir/src/Target.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp -o CMakeFiles/MutatorTest.dir/src/Target.cpp.s

CMakeFiles/MutatorTest.dir/src/SHM.cpp.o: CMakeFiles/MutatorTest.dir/flags.make
CMakeFiles/MutatorTest.dir/src/SHM.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp
CMakeFiles/MutatorTest.dir/src/SHM.cpp.o: CMakeFiles/MutatorTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/MutatorTest.dir/src/SHM.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MutatorTest.dir/src/SHM.cpp.o -MF CMakeFiles/MutatorTest.dir/src/SHM.cpp.o.d -o CMakeFiles/MutatorTest.dir/src/SHM.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp

CMakeFiles/MutatorTest.dir/src/SHM.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MutatorTest.dir/src/SHM.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp > CMakeFiles/MutatorTest.dir/src/SHM.cpp.i

CMakeFiles/MutatorTest.dir/src/SHM.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MutatorTest.dir/src/SHM.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp -o CMakeFiles/MutatorTest.dir/src/SHM.cpp.s

# Object files for target MutatorTest
MutatorTest_OBJECTS = \
"CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o" \
"CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o" \
"CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o" \
"CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o" \
"CMakeFiles/MutatorTest.dir/src/Target.cpp.o" \
"CMakeFiles/MutatorTest.dir/src/SHM.cpp.o"

# External object files for target MutatorTest
MutatorTest_EXTERNAL_OBJECTS =

MutatorTest: CMakeFiles/MutatorTest.dir/test/MutatorTest.cpp.o
MutatorTest: CMakeFiles/MutatorTest.dir/src/Forkserver.cpp.o
MutatorTest: CMakeFiles/MutatorTest.dir/src/Fuzzer.cpp.o
MutatorTest: CMakeFiles/MutatorTest.dir/src/Mutator.cpp.o
MutatorTest: CMakeFiles/MutatorTest.dir/src/Target.cpp.o
MutatorTest: CMakeFiles/MutatorTest.dir/src/SHM.cpp.o
MutatorTest: CMakeFiles/MutatorTest.dir/build.make
MutatorTest: /usr/lib/llvm-14/lib/libLLVMSupport.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMCore.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMIRReader.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMAnalysis.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMTransformUtils.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMAsmParser.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMAnalysis.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMProfileData.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMDebugInfoDWARF.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMObject.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMBitReader.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMCore.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMRemarks.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMBitstreamReader.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMMCParser.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMTextAPI.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMMC.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMBinaryFormat.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMDebugInfoCodeView.a
MutatorTest: /usr/lib/llvm-14/lib/libLLVMSupport.a
MutatorTest: /usr/lib/x86_64-linux-gnu/libz3.so
MutatorTest: /usr/lib/x86_64-linux-gnu/libz.so
MutatorTest: /usr/lib/x86_64-linux-gnu/libtinfo.so
MutatorTest: /usr/lib/llvm-14/lib/libLLVMDemangle.a
MutatorTest: CMakeFiles/MutatorTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable MutatorTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MutatorTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MutatorTest.dir/build: MutatorTest
.PHONY : CMakeFiles/MutatorTest.dir/build

CMakeFiles/MutatorTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MutatorTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MutatorTest.dir/clean

CMakeFiles/MutatorTest.dir/depend:
	cd /home/kali/Desktop/llvm-fuzz/lab/task5/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kali/Desktop/llvm-fuzz/lab/task5 /home/kali/Desktop/llvm-fuzz/lab/task5 /home/kali/Desktop/llvm-fuzz/lab/task5/build /home/kali/Desktop/llvm-fuzz/lab/task5/build /home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles/MutatorTest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/MutatorTest.dir/depend

