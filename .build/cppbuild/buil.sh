#!/bin/sh

echo "build srcs"
echo "build includes"
echo "build build"
echo "build Makefile"
echo "build .ccls"
echo "build CMakeLists"

rm -rf build/*
mkdir build srcs includes
cp ~/.build/cppbuild/Makefile .
cp ~/.build/cppbuild/.ccls .
sed "s/name_project/$1/g" ~/.build/cppbuild/CMakeLists.txt > CMakeLists.txt
