#!/bin/sh

echo "build srcs"
echo "build includes"
echo "build build"
echo "build Makefile"
echo "build .ccls"
echo "build CMakeLists"

mkdir build srcs includes
cp ~/.build/cppbuild/Makefile .
cp ~/.build/cppbuild/CMakeLists.txt .
cp ~/.build/cppbuild/.ccls .
