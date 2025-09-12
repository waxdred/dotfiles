#!/bin/bash

# Détecte si l'écran externe est connecté
EXTERNAL_DISPLAY=$(yabai -m query --displays | jq '.[1]')

if [ "$EXTERNAL_DISPLAY" != "null" ]; then
    # Écran externe connecté - déplace workspace 1 (dev) vers externe
    yabai -m space 1 --display 2
    yabai -m space 2 --display 2
    yabai -m space 3 --display 1
    yabai -m space 4 --display 1
    # etc...
else
    # Pas d'écran externe - tout sur l'écran principal
    for i in {1..8}; do
        yabai -m space $i --display 1
    done
fi
