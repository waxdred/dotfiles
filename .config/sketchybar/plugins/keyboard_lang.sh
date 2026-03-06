#!/bin/bash
# plugins/keyboard_lang.sh — affiche la langue clavier active

CURRENT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null \
  | grep "KeyboardLayout Name" | head -1 | awk '{print $4}')

case "$CURRENT" in
    *French*)              LABEL="FR" ;;
    *U.S.*|*US*|*English*) LABEL="EN" ;;
    *)                     LABEL=$(echo "${CURRENT:0:2}" | tr '[:lower:]' '[:upper:]') ;;
esac

sketchybar --set "$NAME" label="$LABEL"
