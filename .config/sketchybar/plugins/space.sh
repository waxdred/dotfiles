#!/bin/bash
# ~/.config/sketchybar/plugins/space.sh - Version corrigée

# Catppuccin colors
MAUVE=0xffc6a0f6
SUBTEXT0=0xffa5adcb
SURFACE0=0xff363a4f
SURFACE2=0xff5b6078

# Vérifier si yabai est disponible
if ! command -v yabai &> /dev/null; then
    exit 0
fi

# Obtenir l'espace passé en paramètre
SPACE_ID="$1"
if [ -z "$SPACE_ID" ]; then
    # Si pas de paramètre, extraire de SENDER
    SPACE_ID="${NAME#*.}"
fi

# Obtenir l'espace actuellement focusé
CURRENT_SPACE=$(yabai -m query --spaces --space | jq -r '.index' 2>/dev/null)

# Si on n'arrive pas à obtenir l'espace actuel, on sort
if [ -z "$CURRENT_SPACE" ] || [ "$CURRENT_SPACE" = "null" ]; then
    exit 0
fi

# Mettre à jour l'apparence selon si c'est l'espace actif
if [ "$CURRENT_SPACE" = "$SPACE_ID" ]; then
    sketchybar --set "space.$SPACE_ID" icon.color=$MAUVE \
                                      background.color=$SURFACE2 \
                                      background.border_color=$MAUVE
else
    sketchybar --set "space.$SPACE_ID" icon.color=$SUBTEXT0 \
                                      background.color=$SURFACE0 \
                                      background.border_color=$SURFACE2
fi
