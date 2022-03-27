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
# includes target add /includes
target_include_directories(name_project PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
