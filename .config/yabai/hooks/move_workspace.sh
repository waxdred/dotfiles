#!/bin/bash

# Nombre d'écrans connectés
count=$(yabai -m query --displays | jq 'length')

if [ "$count" -eq 1 ]; then
    # 1 écran → workspace 1 sur display 1
    yabai -m space --focus 1
    yabai -m space --display 1
else
    # 2 écrans → workspace 1 sur écran secondaire (ici display 2)
    yabai -m space --focus 1
    yabai -m space --display 2
fi

