#!/usr/bin/env bash
clear
selected=`cat ~/.tmux/plugins/tmux-cheat-fzf/scripts/cheatlist | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query 

query=`echo $query | tr ' ' '+'`
echo $query
tmux neww zsh -c "echo \"curl cht.sh/$selected$query\" & curl cht.sh/$selected$query & while [ : ]; do sleep 1; done"
