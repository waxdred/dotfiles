#!/bin/bash
# Plugin pour le CPU

CPU=$(top -l 1 | grep -E "^CPU" | grep -Eo '[^[:space:]]+%' | head -1 | sed 's/%//')

sketchybar --set cpu label="$CPU%"

