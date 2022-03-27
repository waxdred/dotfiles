#!/bin/sh
cd ./build
cmake ../ && make && ./$1 
