#!/bin/sh

if [[ $# < 1 ]]
	then
		echo "Add 3 argument:\nArg1: Name of executable\nArg2: Name file cpp"
fi

if [ $# -eq 1 ]
then
	echo "build srcs"
	echo "build includes"
	echo "build build"
	echo "build .ccls"
	echo "build CMakeLists"

	rm -rf build/*
	mkdir build srcs includes
	cp ~/.build/cppbuild/.ccls .
	sed "s/name_project/$1/g" ~/.build/cppbuild/CMakeLists.txt > CMakeLists.txt
	sed "s/bin/$1/g" ~/.build/cppbuild/.vimspector.json > .vimspector.json
fi

if [ $# -eq 2 ]
then
	echo "build srcs"
	echo "build includes"
	echo "build build"
	echo "build .ccls"
	echo "build CMakeLists"
	echo "build main.cpp"
	echo "build $2.cpp"
	echo "build $2.hpp"

	rm -rf build/*
	mkdir build srcs includes
	mkdir build/test
	if [ -f "Makefile" ]; then
		echo "Makefile exits"
	else
		echo "build Makefile"
		cp ~/.build/cppbuild/Makefile .
	fi
	cp ~/.build/cppbuild/.ccls .
	touch srcs/main.cpp 
	touch srcs/$2.cpp 
	touch includes/$2.hpp
	sed "s/name_project/$1/g" ~/.build/cppbuild/CMakeLists.txt > CMakeLists.txt
	sed "s/bin/$1/g" ~/.build/cppbuild/.vimspector.json > .vimspector.json
fi

if [ $# -eq 1 ]
then
	echo "build srcs"
	echo "build includes"
	echo "build build"
	echo "build .ccls"
	echo "build CMakeLists"
	echo "build main.cpp"

	rm -rf build/*
	mkdir build srcs includes
	mkdir build/test
	if [ -f "Makefile" ]; then
	if [ -f "Makefile" ]; then
		echo "Makefile exits"
	else
		echo "build Makefile"
		cp ~/.build/cppbuild/Makefile .
	fi
	cp ~/.build/cppbuild/.ccls .
	sed "s/name_project/$1/g" ~/.build/cppbuild/CMakeLists.txt > CMakeLists.txt
	sed "s/bin/$1/g" ~/.build/cppbuild/.vimspector.json > .vimspector.json
fi
