#!/bin/sh

FILE=../compile_commands.json
cd ./build
if [ -f "$FILE" ]; then	
	make && ctest 
else
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make && ctest 
	mv compile_commands.json ../. 2> /dev/null
fi

if [ $# -eq 1 ]
then
	cat Testing/Temporary/LastTest.log
fi
mv compile_commands.json ../. 2> /dev/null
