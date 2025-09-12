#!/bin/bash
# Plugin pour afficher le titre de la fenêtre active

WINDOW=$(yabai -m query --windows --window | jq -r '.title // "Desktop"')
APP=$(yabai -m query --windows --window | jq -r '.app // ""')

if [ "$WINDOW" = "null" ] || [ -z "$WINDOW" ]; then
    DISPLAY_TEXT="Desktop"
else
    # Limiter la longueur du titre
    if [ ${#WINDOW} -gt 40 ]; then
        WINDOW="${WINDOW:0:37}..."
    fi
    
    if [ -n "$APP" ] && [ "$APP" != "null" ]; then
        DISPLAY_TEXT="$APP: $WINDOW"
    else
        DISPLAY_TEXT="$WINDOW"
    fi
fi

sketchybar --set window_title label="$DISPLAY_TEXT"
