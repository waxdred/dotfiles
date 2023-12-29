#!/bin/sh

ip=$(ifconfig | grep inet | grep netmask | awk '{print $2}' | sed -n '2p')

echo "#[fg=cyan] #[bg=cyan, fg=black]󰩟 ${ip}#[bg=#24273A, fg=cyan]"
