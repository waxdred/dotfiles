# doc
# https://codevion.github.io/#!cpp/cmake.md

cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# name project 
project(name_project VERSION 1.0)
# SRC_FILES and add var to add_executable ${SRC_FILES}
file(GLOB_RECURSE SRC_FILES srcs/*.cpp)

add_executable(name_project ${SRC_FILES})
target_include_directories(name_project PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/includes)
target_compile_options(name_project PUBLIC -g3 -Wall -Wextra -Werror Weffc++ -std=c++98)

