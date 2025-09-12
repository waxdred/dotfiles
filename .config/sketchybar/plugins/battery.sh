#!/bin/bash
# Plugin pour la batterie

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

# Icônes selon le niveau de batterie
if [ $PERCENTAGE -gt 75 ]; then
    ICON="󰁹"
elif [ $PERCENTAGE -gt 50 ]; then
    ICON="󰂀"
elif [ $PERCENTAGE -gt 25 ]; then
    ICON="󰁾"
else
    ICON="󰁺"
fi

# Modifier l'icône si en charge
if [[ $CHARGING != "" ]]; then
    ICON="󰂄"
fi

sketchybar --set battery icon="$ICON" label="$PERCENTAGE%"
