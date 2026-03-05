#!/bin/bash

setup_app_rules() {
    echo "$(date): Setting up app rules" >> /tmp/display_changes.log
    
    # Nettoyer les anciennes règles (optionnel)
    # yabai -m rule --remove all
    
    # Règles pour les applications
    # Terminal/Code workspace
    yabai -m rule --add app="^Ghostty$" space=5
    
    # Web workspace
    yabai -m rule --add app="^brave Browser$" space=1
    
    # Chat workspace
    yabai -m rule --add app="^Slack$" space=2
    yabai -m rule --add app="^Discord$" space=2
    yabai -m rule --add app="^Telegram$" space=2
    yabai -m rule --add app="^WhatsApp$" space=2
    yabai -m rule --add app="^Messages$" space=2
    
    # Obsidian workspace
    yabai -m rule --add app="^Obsidian$" space=3
    
    # AI workspace
    yabai -m rule --add app="^Claude$" space=4
    
    # Media workspace
    yabai -m rule --add app="^Spotify$" space=6
    yabai -m rule --add app="^Music$" space=6
    yabai -m rule --add app="^VLC$" space=6
    yabai -m rule --add app="^IINA$" space=6
    yabai -m rule --add app="^Photos$" space=6
    yabai -m rule --add app="^Adobe Photoshop$" space=6
    yabai -m rule --add app="^Figma$" space=6
    
    # Other workspace
    yabai -m rule --add app="^Finder$" space=7
    yabai -m rule --add app="^System Preferences$" space=7
    yabai -m rule --add app="^System Settings$" space=7
    yabai -m rule --add app="^Activity Monitor$" space=7

    # Mv applications
    yabai -m rule --add app="^VirtualBox$" space=9
    yabai -m rule --add app="^Utm$" space=9
    
    echo "$(date): App rules configured" >> /tmp/display_changes.log
}

setup_app_rules
