#!/bin/sh

cppcheck srcs/* includes/*
cd ./build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make && leaks -atExit -- ./$1
mv compile_commands.json ../. 2> /dev/null
