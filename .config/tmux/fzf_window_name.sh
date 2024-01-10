#!/bin/bash

# Liste des préfixes
prefixes=("Dev" "Setting" "Code" "React" "Go" "C" "Rust" "Docker" "Ansible" "Fish")

# Commande pour afficher fzf dans un popup tmux
selected_prefix=$(printf '%s\n' "${prefixes[@]}" | fzf --prompt='Select Prefix: ')

# Sortie si rien n'est sélectionné
[ -z "$selected_prefix" ] && exit 0

# Lire le suffixe de l'utilisateur
read -rp "Enter Suffix: " suffix

# Créer une nouvelle fenêtre tmux avec le nom choisi
tmux new-window -n "${selected_prefix}_${suffix}"
