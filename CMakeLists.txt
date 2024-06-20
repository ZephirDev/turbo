cmake_minimum_required(VERSION 3.28)
project(turbo VERSION 2024.1.0)

set(CMAKE_CXX_STANDARD 20)
if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    # using Clang
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # using GCC
    add_compile_options(-fmodules-ts)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
    # using Intel C++
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # using Visual Studio C++
endif()

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    include(cmake/gtest.cmake)
    include(cmake/cppcheck.cmake)
    include(cmake/gcov.cmake)
endif ()

add_subdirectory(modules)
