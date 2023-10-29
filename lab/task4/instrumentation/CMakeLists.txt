set(LLVM_DIR "/home/kali/Desktop/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10/lib/cmake/llvm")
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Now build our tools
add_executable(instrumentation instrumentation.cpp)

# Find the libraries that correspond to the LLVM components
# that we wish to use
llvm_map_components_to_libnames(llvm_libs support core irreader analysis TransformUtils)

# Link against LLVM libraries
target_link_libraries(instrumentation ${llvm_libs})
