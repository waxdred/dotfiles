#!/bin/bash


####### Init tools for claude code #####


echo "Initializing tools for claude code..."


read -p "Do you want init ruflo? (y/n)" ruflo_choice

if [[ "$ruflo_choice" == "y" ]]; then
    echo "Initializing ruflo..."
    npx ruflo@latest init
fi


### init rtk
read -p "Do you want init rtk? (y/n)" rtx_choice
if [[ "$rtx_choice" == "y" ]]; then
    echo "Initializing rtx..."
    rtk init
fi

## init grepai
read -p "Do you want init grepai? (y/n)" grepai_choice
if [[ "$grepai_choice" == "y" ]]; then
    echo "Initializing grepai..."
    grepai init
fi

## init bmad
read -p "Do you want init bmad? (y/n)" bmad_choice
if [[ "$bmad_choice" == "y" ]]; then
    echo "Initializing bmad..."
    npx bmad-method install
fi
