#!/bin/bash
# Plugin pour la mémoire

MEMORY=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5}' | sed 's/%//')

if [ -z "$MEMORY" ]; then
    # Méthode alternative
    MEMORY=$(vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+):\s+(\d+)/ and printf("%-16s % 16.2f MB\n", "$1:", $2 * $size / 1048576);' | grep "Pages active" | awk '{print $3}' | cut -d. -f1)
fi

sketchybar --set memory label="$MEMORY%"

