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
include CMakeFiles/TargetTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TargetTest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TargetTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TargetTest.dir/flags.make

CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o: CMakeFiles/TargetTest.dir/flags.make
CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/test/TargetTest.cpp
CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o: CMakeFiles/TargetTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o -MF CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o.d -o CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/test/TargetTest.cpp

CMakeFiles/TargetTest.dir/test/TargetTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TargetTest.dir/test/TargetTest.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/test/TargetTest.cpp > CMakeFiles/TargetTest.dir/test/TargetTest.cpp.i

CMakeFiles/TargetTest.dir/test/TargetTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TargetTest.dir/test/TargetTest.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/test/TargetTest.cpp -o CMakeFiles/TargetTest.dir/test/TargetTest.cpp.s

CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o: CMakeFiles/TargetTest.dir/flags.make
CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp
CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o: CMakeFiles/TargetTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o -MF CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o.d -o CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp

CMakeFiles/TargetTest.dir/src/Forkserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TargetTest.dir/src/Forkserver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp > CMakeFiles/TargetTest.dir/src/Forkserver.cpp.i

CMakeFiles/TargetTest.dir/src/Forkserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TargetTest.dir/src/Forkserver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Forkserver.cpp -o CMakeFiles/TargetTest.dir/src/Forkserver.cpp.s

CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o: CMakeFiles/TargetTest.dir/flags.make
CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp
CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o: CMakeFiles/TargetTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o -MF CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o.d -o CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp

CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp > CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.i

CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Fuzzer.cpp -o CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.s

CMakeFiles/TargetTest.dir/src/Mutator.cpp.o: CMakeFiles/TargetTest.dir/flags.make
CMakeFiles/TargetTest.dir/src/Mutator.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp
CMakeFiles/TargetTest.dir/src/Mutator.cpp.o: CMakeFiles/TargetTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/TargetTest.dir/src/Mutator.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TargetTest.dir/src/Mutator.cpp.o -MF CMakeFiles/TargetTest.dir/src/Mutator.cpp.o.d -o CMakeFiles/TargetTest.dir/src/Mutator.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp

CMakeFiles/TargetTest.dir/src/Mutator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TargetTest.dir/src/Mutator.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp > CMakeFiles/TargetTest.dir/src/Mutator.cpp.i

CMakeFiles/TargetTest.dir/src/Mutator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TargetTest.dir/src/Mutator.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Mutator.cpp -o CMakeFiles/TargetTest.dir/src/Mutator.cpp.s

CMakeFiles/TargetTest.dir/src/Target.cpp.o: CMakeFiles/TargetTest.dir/flags.make
CMakeFiles/TargetTest.dir/src/Target.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp
CMakeFiles/TargetTest.dir/src/Target.cpp.o: CMakeFiles/TargetTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/TargetTest.dir/src/Target.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TargetTest.dir/src/Target.cpp.o -MF CMakeFiles/TargetTest.dir/src/Target.cpp.o.d -o CMakeFiles/TargetTest.dir/src/Target.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp

CMakeFiles/TargetTest.dir/src/Target.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TargetTest.dir/src/Target.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp > CMakeFiles/TargetTest.dir/src/Target.cpp.i

CMakeFiles/TargetTest.dir/src/Target.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TargetTest.dir/src/Target.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/Target.cpp -o CMakeFiles/TargetTest.dir/src/Target.cpp.s

CMakeFiles/TargetTest.dir/src/SHM.cpp.o: CMakeFiles/TargetTest.dir/flags.make
CMakeFiles/TargetTest.dir/src/SHM.cpp.o: /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp
CMakeFiles/TargetTest.dir/src/SHM.cpp.o: CMakeFiles/TargetTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/TargetTest.dir/src/SHM.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TargetTest.dir/src/SHM.cpp.o -MF CMakeFiles/TargetTest.dir/src/SHM.cpp.o.d -o CMakeFiles/TargetTest.dir/src/SHM.cpp.o -c /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp

CMakeFiles/TargetTest.dir/src/SHM.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TargetTest.dir/src/SHM.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp > CMakeFiles/TargetTest.dir/src/SHM.cpp.i

CMakeFiles/TargetTest.dir/src/SHM.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TargetTest.dir/src/SHM.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/llvm-fuzz/lab/task5/src/SHM.cpp -o CMakeFiles/TargetTest.dir/src/SHM.cpp.s

# Object files for target TargetTest
TargetTest_OBJECTS = \
"CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o" \
"CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o" \
"CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o" \
"CMakeFiles/TargetTest.dir/src/Mutator.cpp.o" \
"CMakeFiles/TargetTest.dir/src/Target.cpp.o" \
"CMakeFiles/TargetTest.dir/src/SHM.cpp.o"

# External object files for target TargetTest
TargetTest_EXTERNAL_OBJECTS =

TargetTest: CMakeFiles/TargetTest.dir/test/TargetTest.cpp.o
TargetTest: CMakeFiles/TargetTest.dir/src/Forkserver.cpp.o
TargetTest: CMakeFiles/TargetTest.dir/src/Fuzzer.cpp.o
TargetTest: CMakeFiles/TargetTest.dir/src/Mutator.cpp.o
TargetTest: CMakeFiles/TargetTest.dir/src/Target.cpp.o
TargetTest: CMakeFiles/TargetTest.dir/src/SHM.cpp.o
TargetTest: CMakeFiles/TargetTest.dir/build.make
TargetTest: /usr/lib/llvm-14/lib/libLLVMSupport.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMCore.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMIRReader.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMAnalysis.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMTransformUtils.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMAsmParser.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMAnalysis.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMProfileData.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMDebugInfoDWARF.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMObject.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMBitReader.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMCore.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMRemarks.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMBitstreamReader.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMMCParser.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMTextAPI.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMMC.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMBinaryFormat.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMDebugInfoCodeView.a
TargetTest: /usr/lib/llvm-14/lib/libLLVMSupport.a
TargetTest: /usr/lib/x86_64-linux-gnu/libz3.so
TargetTest: /usr/lib/x86_64-linux-gnu/libz.so
TargetTest: /usr/lib/x86_64-linux-gnu/libtinfo.so
TargetTest: /usr/lib/llvm-14/lib/libLLVMDemangle.a
TargetTest: CMakeFiles/TargetTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable TargetTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TargetTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TargetTest.dir/build: TargetTest
.PHONY : CMakeFiles/TargetTest.dir/build

CMakeFiles/TargetTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TargetTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TargetTest.dir/clean

CMakeFiles/TargetTest.dir/depend:
	cd /home/kali/Desktop/llvm-fuzz/lab/task5/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kali/Desktop/llvm-fuzz/lab/task5 /home/kali/Desktop/llvm-fuzz/lab/task5 /home/kali/Desktop/llvm-fuzz/lab/task5/build /home/kali/Desktop/llvm-fuzz/lab/task5/build /home/kali/Desktop/llvm-fuzz/lab/task5/build/CMakeFiles/TargetTest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/TargetTest.dir/depend
