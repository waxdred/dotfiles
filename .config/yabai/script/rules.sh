#!/bin/bash

setup_app_rules() {
    echo "$(date): Setting up app rules" >> /tmp/display_changes.log
    
    # Nettoyer les anciennes règles (optionnel)
    # yabai -m rule --remove all
    
    # Règles pour les applications
    # Terminal/Code workspace
    yabai -m rule --add app="^Ghostty$" space=code
    
    # Web workspace
    yabai -m rule --add app="^brave Browser$" space=web
    
    # Chat workspace
    yabai -m rule --add app="^Slack$" space=chat
    yabai -m rule --add app="^Discord$" space=chat
    yabai -m rule --add app="^Telegram$" space=chat
    yabai -m rule --add app="^WhatsApp$" space=chat
    yabai -m rule --add app="^Messages$" space=chat
    
    # Obsidian workspace
    yabai -m rule --add app="^Obsidian$" space=obsidian
    
    # AI workspace
    yabai -m rule --add app="^Claude$" space=ai
    
    # Media workspace
    yabai -m rule --add app="^Spotify$" space=media
    yabai -m rule --add app="^Music$" space=media
    yabai -m rule --add app="^VLC$" space=media
    yabai -m rule --add app="^IINA$" space=media
    yabai -m rule --add app="^Photos$" space=media
    yabai -m rule --add app="^Adobe Photoshop$" space=media
    yabai -m rule --add app="^Figma$" space=media
    
    # Other workspace
    yabai -m rule --add app="^Finder$" space=other
    yabai -m rule --add app="^System Preferences$" space=other
    yabai -m rule --add app="^System Settings$" space=other
    yabai -m rule --add app="^Activity Monitor$" space=other
    
    echo "$(date): App rules configured" >> /tmp/display_changes.log
}

setup_app_rules
