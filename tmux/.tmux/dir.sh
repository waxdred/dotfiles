#!/bin/bash

get_dir(){
    dir="$(tmux display-message -a | grep pane_current_path=)"
    dir="$(echo $dir | cut -d'/' -f3-)"
    home="/"
    dir="$home$dir"
    dir="$(echo $dir | tr '/' '')"
    printf "%s" $dir
}

main(){
    get_dir
}

main
