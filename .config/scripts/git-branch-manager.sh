#!/usr/bin/env sh

GIT_COLOR="#00FCFE"

git_color_text(){
    text=$1
    gum style --foreground $GIT_COLOR "$text"
}

Title(){
    gum style\
        --border normal\
        --margin "1"\
        --border-foreground "$GIT_COLOR"\
        " Git branch Manager "
}

Title

get_branches(){
    gum choose --no-limit $(git branch --format="%(refname:short)")
}

echo "Choose $(git_color_text "branches") to operate on:"
branches=$(get_branches)

git switch $branches
git pull
