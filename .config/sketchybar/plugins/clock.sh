#!/bin/bash
# Plugin pour l'horloge

DATE=$(date "+%a %d %b")
TIME=$(date "+%H:%M")

sketchybar --set clock label="$DATE • $TIME"
