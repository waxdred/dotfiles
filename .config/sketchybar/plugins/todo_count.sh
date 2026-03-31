#!/bin/bash
# ~/.config/sketchybar/plugins/todo_count.sh

VAULT_PATH="$HOME/Obsidian/LIRYC-IHU-Vault"

# Compter les tâches ouvertes (- [ ])
OPEN_TASKS=$(find "$VAULT_PATH" -name "*.md" -type f -exec grep -h "^- \[ \]" {} \; 2>/dev/null | wc -l)

# Compter les tâches complétées (- [x])
COMPLETED_TASKS=$(find "$VAULT_PATH" -name "*.md" -type f -exec grep -h "^- \[x\]" {} \; 2>/dev/null | wc -l)

# Déterminer la couleur selon le nombre de tâches
if [ "$OPEN_TASKS" -eq 0 ]; then
    COLOR=$GREEN  # Vert si pas de tâches
elif [ "$OPEN_TASKS" -lt 5 ]; then
    COLOR=$BLUE   # Bleu si peu de tâches
elif [ "$OPEN_TASKS" -lt 10 ]; then
    COLOR=$YELLOW # Jaune si modéré
else
    COLOR=$RED    # Rouge si beaucoup
fi

# Afficher le résultat
sketchybar --set todo_count label="$OPEN_TASKS" \
                            icon.color=$COLOR \
                            icon="󰇮" \
                            label.color=$COLOR
