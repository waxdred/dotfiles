#!/bin/bash
# Remplacez le chemin du répertoire personnel par ~
echo $1 | sed "s|^$HOME|~|"


