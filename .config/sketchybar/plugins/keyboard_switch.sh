#!/bin/bash
# Switch to next keyboard input source, then refresh the label

osascript -e 'tell application "System Events" to keystroke space using {control down}'

sleep 0.4
bash "$HOME/.config/sketchybar/plugins/keyboard_lang.sh"
