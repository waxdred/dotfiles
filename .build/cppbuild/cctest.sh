#!/bin/sh

cd ./build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make && ctest 
if [ $# -eq 1 ]
then
	cat Testing/Temporary/LastTest.log
fi
mv compile_commands.json ../. 2> /dev/null
