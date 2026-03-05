#!/bin/bash
sleep 3  # Laisser le temps à yabai de démarrer

yabai -m space --focus 1
open -a "Brave Browser" &
sleep 1

yabai -m space --focus 5
open -a "Ghostty" &
sleep 1

yabai -m space --focus 6
open -a "Spotify" &
sleep 1

yabai -m space --focus 1
