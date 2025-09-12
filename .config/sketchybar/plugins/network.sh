#!/bin/bash
# Plugin pour le réseau

# Détecter la connexion
if ping -c 1 google.com &> /dev/null; then
    # Vérifier si WiFi ou Ethernet
    WIFI=$(networksetup -getairportnetwork en0 2>/dev/null | cut -d: -f2 | sed 's/^[ \t]*//')
    
    if [ -n "$WIFI" ] && [ "$WIFI" != "You are not associated with an AirPort network." ]; then
        ICON="󰤨"
        LABEL="$WIFI"
    else
        # Probablement Ethernet
        ICON="󰈀"
        LABEL="Ethernet"
    fi
else
    ICON="󰤭"
    LABEL="Offline"
fi

sketchybar --set network icon="$ICON" label="$LABEL"
