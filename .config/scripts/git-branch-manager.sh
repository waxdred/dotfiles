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
        " Dotfile Manager "
}


get_choose(){
    gum choose --no-limit "Nvim" "Fish" "Tmux" "Plugin" "Lsp" 
}

selectDir(){
        if [[ $data -eq "Nvim" ]]; then
            cd ~/.dotfiles/.config/nvim/            
            echo $PWD
        elif [[ $data -eq "Fish" ]]; then
            cd ~/.dotfiles/.config/fish/           
        elif [[ $data -eq "Tmux" ]]; then
            cd ~/.dotfiles/.tmux/        
        elif [[ $data -eq "Plugin" ]]; then
            cd ~/.dotfiles/.config/nvim/plugin/            
        elif [[ $data -eq "Lsp" ]]; then
            cd ~/.dotfiles/.config/nvim/plugin/Lsp
        fi
}

Title
data=$(get_choose)
selectDir 
