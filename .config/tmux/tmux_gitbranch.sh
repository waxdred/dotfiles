#!/bin/sh

get_git_branch() {
    # Naviguer vers le répertoire fourni
    cd "$1" > /dev/null 2>&1

    # Vérifier si le répertoire est un dépôt Git
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Afficher la branche Git actuelle
        branch=$(git branch --show-current)
        if git status --porcelain | grep 'M'; then
            echo "#[fg=red] #[bg=red, fg=black] ${branch}#[bg=#24273A, fg=red]"
        else
            echo "#[fg=#A96FF4] #[bg=#A96FF4, fg=black] ${branch}#[bg=#24273A, fg=#A96FF4] "
        fi
    else
        echo ""
    fi

    # Retourner au répertoire d'origine
    cd - > /dev/null 2>&1
}

# Appeler la fonction avec le chemin fourni
get_git_branch "$1"

