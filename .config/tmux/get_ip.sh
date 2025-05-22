#!/bin/sh

ip=$(ip a | grep inet | grep \/24 | grep dynamic | awk '{print $2}' | cut -d'/' -f1)

echo "#[fg=cyan] #[bg=cyan, fg=black]󰩟 ${ip}#[bg=#24273A, fg=cyan]"
