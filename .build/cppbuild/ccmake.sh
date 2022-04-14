#!/bin/sh
cd ./build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make && ./$1
mv compile_commands.json ../.
