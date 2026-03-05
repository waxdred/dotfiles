#!/bin/bash
# Fichier: ~/.config/yabai/setup_spaces.sh
# Attendre un peu pour que yabai se stabilise après le changement d'écran
sleep 1
# Log pour debug (optionnel)
echo "$(date): Display change detected" >> /tmp/display_changes.log
# Ta fonction de setup des espaces
setup_yabai_spaces() {
    display_count=$(yabai -m query --displays | jq length)
    
    echo "$(date): Configuring for $display_count display(s)" >> /tmp/display_changes.log
    
    if [ "$display_count" -eq 1 ]; then
        # 1 écran = 7 espaces
        # Supprimer les espaces en trop
        for space_index in $(yabai -m query --spaces | jq '.[].index | select(. > 7)'); do
            yabai -m space --destroy "$space_index"
        done
        
        # Créer les espaces manquants si nécessaire
        current_spaces=$(yabai -m query --spaces | jq length)
        while [ "$current_spaces" -lt 7 ]; do
            yabai -m space --create
            current_spaces=$((current_spaces + 1))
        done
        
        # Labéliser les espaces
        yabai -m space 1 --label web
        yabai -m space 2 --label chat
        yabai -m space 3 --label obsidian
        yabai -m space 4 --label ai
        yabai -m space 5 --label code
        yabai -m space 6 --label media
        yabai -m space 7 --label documentation
        yabai -m space 8 --label data
        yabai -m space 9 --label vm
        
    elif [ "$display_count" -eq 2 ]; then
        # 2 écrans = 8 espaces
        # Supprimer les espaces en trop
        for space_index in $(yabai -m query --spaces | jq '.[].index | select(. > 8)'); do
            yabai -m space --destroy "$space_index"
        done
        
        # Créer les espaces manquants
        current_spaces=$(yabai -m query --spaces | jq length)
        while [ "$current_spaces" -lt 8 ]; do
            yabai -m space --create
            current_spaces=$((current_spaces + 1))
        done
        
        # Labéliser les espaces
        yabai -m space 1 --label web
        yabai -m space 2 --label chat
        yabai -m space 3 --label obsidian
        yabai -m space 4 --label ai
        yabai -m space 5 --label code
        yabai -m space 6 --label media
        yabai -m space 7 --label other
        yabai -m space 8 --label data
        
        # Assigner aux écrans (avec retry en cas d'échec)
        for attempt in 1 2 3; do
            yabai -m space 1 --display 1 2>/dev/null
            yabai -m space 2 --display 1 2>/dev/null
            yabai -m space 3 --display 1 2>/dev/null
            yabai -m space 4 --display 1 2>/dev/null
            yabai -m space 5 --display 2 2>/dev/null
            yabai -m config --space 5 top_padding 36
            yabai -m space 6 --display 2 2>/dev/null
            yabai -m config --space 6 top_padding 36
            yabai -m space 7 --display 2 2>/dev/null
            yabai -m config --space 7 top_padding 36
            yabai -m space 8 --display 2 2>/dev/null
            yabai -m config --space 8 top_padding 36
            
            # Vérifier si ça a marché, sinon retry
            if [ "$(yabai -m query --spaces --space 8 | jq '.display')" = "2" ]; then
                break
            fi
            sleep 0.5
        done

    elif [ "$display_count" -eq 3 ]; then
        # 3 écrans = 12 espaces (4 par écran)
        # Supprimer les espaces en trop
        for space_index in $(yabai -m query --spaces | jq '.[].index | select(. > 12)'); do
            yabai -m space --destroy "$space_index"
        done
        
        # Créer les espaces manquants
        current_spaces=$(yabai -m query --spaces | jq length)
        while [ "$current_spaces" -lt 12 ]; do
            yabai -m space --create
            current_spaces=$((current_spaces + 1))
        done
        
        # Labéliser les espaces
        yabai -m space 1 --label web
        yabai -m space 2 --label chat
        yabai -m space 3 --label obsidian
        yabai -m space 4 --label ai
        
        yabai -m space 5 --label code
        yabai -m space 6 --label media
        yabai -m space 7 --label data
        yabai -m space 8 --label vm
        
        yabai -m space 9 --label research
        yabai -m space 10 --label debug
        yabai -m space 11 --label tools
        yabai -m space 12 --label archive
        
        # Assigner aux écrans (avec retry en cas d'échec)
        for attempt in 1 2 3; do
            # Écran 1: espaces 1-4
            yabai -m space 1 --display 1 2>/dev/null
            yabai -m space 2 --display 1 2>/dev/null
            yabai -m space 3 --display 1 2>/dev/null
            yabai -m space 4 --display 1 2>/dev/null
            
            # Écran 2: espaces 5-8
            yabai -m space 5 --display 2 2>/dev/null
            yabai -m config --space 5 top_padding 36
            yabai -m space 6 --display 2 2>/dev/null
            yabai -m config --space 6 top_padding 36
            yabai -m space 7 --display 2 2>/dev/null
            yabai -m config --space 7 top_padding 36
            yabai -m space 8 --display 2 2>/dev/null
            yabai -m config --space 8 top_padding 36
            
            # Écran 3: espaces 9-12
            yabai -m space 9 --display 3 2>/dev/null
            yabai -m config --space 9 top_padding 36
            yabai -m space 10 --display 3 2>/dev/null
            yabai -m config --space 10 top_padding 36
            yabai -m space 11 --display 3 2>/dev/null
            yabai -m config --space 11 top_padding 36
            yabai -m space 12 --display 3 2>/dev/null
            yabai -m config --space 12 top_padding 36
            
            # Vérifier si ça a marché, sinon retry
            if [ "$(yabai -m query --spaces --space 12 | jq '.display')" = "3" ]; then
                break
            fi
            sleep 0.5
        done
    fi
    
    echo "$(date): Setup completed" >> /tmp/display_changes.log
    bash $HOME/.config/yabai/script/rules.sh
}
# Appeler la fonction
setup_yabai_spaces
