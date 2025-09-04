#!/bin/bash


## Install dotfiles for mac os or linux hyprland
## For hyprland, install dependencies first for arch linux

unameOut=$(uname -a)

Echo() {
    echo -e "\033[1;32m$1\033[0m"
}

tmux() {
    Echo "Installing tmux..."
    sudo pacman -S --noconfirm tmux
    Echo "Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    Echo "link ../.tmux.conf to ~/.tmux.conf"
    ln -s $(pwd)/.tmux.conf ~/.tmux.conf
}

fish() {
    Echo "Installing fish shell..."
    sudo pacman -S --noconfirm fish
    Echo "Setup fish shell as default shell..."
    chsh -s /usr/bin/fish
}

hyprland() {
    Echo "Installing dependencies for hyprland..."
    sudo pacman -S --noconfirm \
        hyprland \
        waybar \
        hyprpaper \
        foot \
        git \
        rofi \
        dunst \
        pamixer \
        pavucontrol \
        thunar \
        thunar-archive-plugin \
        thunar-volman \
        tumbler \
        ffmpegthumbnailer \
        openssh
}

nvim() {
    Echo "Installing nvim and other tools..."

    sudo pacman -S --noconfirm nvim \
        wl-clipboard \
        fd \
        lua5 \
        luarocks \
        bluez-utils
}

link() {
    Echo "Link ../.config/ to ~/.config"
    for item in $(pwd)/.config/*; do
      Echo "Linking $item to ~/.config/"
      ln -s "$item" ~/.config/
    done
}

if [[ "$unameOut" == *"Linux"* && "$unameOut" == *"arch"* ]]; then
    echo "Installing dependencies for hyprland on arch linux..."
    ## switch case with first arg or run all if no arg
    case $1 in
      tmux)
          tmux
          ;;
      fish)
          fish
          ;;
      hyprland)
          hyprland
          ;;
      nvim)
          nvim
          ;;
      link)
          link
          ;;
      *)
          tmux
          fish
          hyprland
          nvim
          link
          ;;
    esac

else
    Echo "Not arch linux, skipping dependencies installation..."
    Echo "Link .config/ to ~/.config"
    Echo "Link ../.config/ to ~/.config"
    for item in $(pwd)/.config/*; do
      Echo "Linking $item to ~/.config/"
      ln -s "$item" ~/.config/
    done
fi
