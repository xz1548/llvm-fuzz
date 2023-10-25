cmake_minimum_required(VERSION 3.27)
project(Amon_Fuzzer)

# 设置编译器选项等
set(CMAKE_CXX_STANDARD 17)

# 设置源文件路径
set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/test)
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
# set llvm dir
set(LLVM_DIR "/usr/lib/llvm-14/lib/cmake/llvm")
find_package(LLVM REQUIRED CONFIG)


# 添加源文件
set(SOURCES
    ${SOURCE_DIR}/Forkserver.cpp
    ${SOURCE_DIR}/Fuzzer.cpp
    ${SOURCE_DIR}/Mutator.cpp
    ${SOURCE_DIR}/Target.cpp
    ${SOURCE_DIR}/SHM.cpp
)

# 添加测试文件
set(TEST_SOURCES
    ${TEST_DIR}/ForkserverTest.cpp
    ${TEST_DIR}/FuzzerTest.cpp
    ${TEST_DIR}/MutatorTest.cpp
    ${TEST_DIR}/TargetTest.cpp
    ${TEST_DIR}/SHMTest.cpp
)

# 添加包含目录
include_directories(${INCLUDE_DIR})
# add llvm include dir
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# 添加可执行文件
# add_executable(Main ${SOURCE_DIR}/Main.cpp)

llvm_map_components_to_libnames(llvm_libs support core irreader analysis TransformUtils)

# 添加测试可执行文件
enable_testing()

foreach(TEST_SOURCE ${TEST_SOURCES})
    # 获取测试文件的文件名（不包含扩展名）
    get_filename_component(TEST_NAME ${TEST_SOURCE} NAME_WE)
    add_executable(${TEST_NAME} ${TEST_SOURCE} ${SOURCES})
    target_link_libraries(${TEST_NAME} ${llvm_libs} stdc++fs)
endforeach(TEST_SOURCE)