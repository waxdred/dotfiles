#!/bin/bash


## Install dotfiles for mac os or linux hyprland
## For hyprland, install dependencies first for arch linux

unameOut=$(uname -a)

Echo() {
    echo -e "\033[1;32m$1\033[0m"
}

if [[ "$unameOut" == *"Linux"* && "$unameOut" == *"arch"* ]]; then
    echo "Installing dependencies for hyprland on arch linux..."

    Echo "Updating system and installing fish shell..."
    sudo pacman -Syu --noconfirm fish
    Echo "Setup fish shell as default shell..."
    chsh -s /usr/bin/fish
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
        openssh \

    Echo "Installing nvim and other tools..."

    sudo pacman -S --noconfirm nvim \
        wl-clipboard \
        fd \
        lua5 \
        luarocks \
        bluez-utils
    Echo "Link ../.config/ to ~/.config"
    for item in $(pwd)/.config/*; do
      Echo "Linking $item to ~/.config/"
      ln -s "$item" ~/.config/
    done
else
    Echo "Not arch linux, skipping dependencies installation..."
    Echo "Link .config/ to ~/.config"
    Echo "Link ../.config/ to ~/.config"
    for item in $(pwd)/.config/*; do
      Echo "Linking $item to ~/.config/"
      ln -s "$item" ~/.config/
    done
fi
