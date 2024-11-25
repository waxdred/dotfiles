#!/usr/bin/env bash

# tmux-focus-plugin.tmux
# Configuration utilisant les variables Catppuccino Mocha

# Récupération des variables Catppuccino
bg_active="#{@ctp_active_bg}"           # Background color
bg_inactive="#{@ctp_inactive_bg}"           # Background color
surface_1="#{@ctp_surface_1}"  # Surface color 1
fg="#{@ctp_fg}"           # Foreground color
mauve="#{@ctp_mauve}"     # Accent color
crust="#{@ctp_crust}"     # Darker background

tmux set-window-option -g window-active-style "bg=$bg_active"
tmux set-window-option -g window-style "bg=$bg_inactive"

# Configuration des bordures avec les variables Catppuccino
tmux set-option -g pane-active-border-style "fg=$mauve,bold"
tmux set-option -g pane-border-style "fg=$surface_1"

# Ajout d'un indicateur visuel dans le coin utilisant les couleurs Catppuccino
#tmux set-option -g pane-active-border-format "#[fg=$mauve,bold]▣#[default]"
