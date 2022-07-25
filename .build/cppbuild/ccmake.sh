#!/bin/sh

FILE=../compile_commands.json

cppcheck srcs/* includes/*
cd ./build
if [ -f "$FILE" ]; then
	echo "make"
	make && leaks -atExit -- ./$1
else		
	echo "Build all"
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make && leaks -atExit -- ./$1
	mv compile_commands.json ../. 2> /dev/null
fi

