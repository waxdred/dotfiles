#!/bin/sh

echo "build srcs"
echo "build includes"
echo "build build"
echo "build Makefile"
echo "build .ccls"
echo "build CMakeLists"
echo "build main.cpp"
echo "build $2.cpp"
echo "build $2.hpp"

rm -rf build/*
mkdir build srcs includes
cp ~/.build/cppbuild/Makefile .
cp ~/.build/cppbuild/.ccls .
touch srcs/main.cpp 
touch srcs/$2.cpp 
touch includes/$2.hpp
sed "s/name_project/$1/g" ~/.build/cppbuild/CMakeLists.txt > CMakeLists.txt
sed "s/bin/$3/g" ~/.build/cppbuild/.vimspector.json > .vimspector.json
