#!/bin/bash

# Récupérer le pane ID actuel
PANE_ID=$(tmux display-message -p '#{pane_id}')

# Récupérer le KUBECONFIG depuis le store tmux
KUBECONFIG_PATH=$(jq -r ".panes[\"$PANE_ID\"].vars.KUBECONFIG // empty" /tmp/tmux_env_store.json 2>/dev/null)

# Si pas de KUBECONFIG dans le store, utiliser celui de l'environnement
if [ -z "$KUBECONFIG_PATH" ]; then
    KUBECONFIG_PATH=$KUBECONFIG
fi

# Si toujours pas de KUBECONFIG, utiliser le défaut
if [ -z "$KUBECONFIG_PATH" ]; then
    KUBECONFIG_PATH="$HOME/.kube/config"
fi

# Exporter temporairement pour kubectl
export KUBECONFIG="$KUBECONFIG_PATH"

# Récupérer les infos du cluster
CLUSTER=$(kubectl config view --minify --output 'jsonpath={.contexts[0].context.cluster}' 2>/dev/null)
NAMESPACE=$(kubectl config view --minify -o 'jsonpath={..namespace}' 2>/dev/null)

# Afficher le résultat avec le path du kubeconfig
if [ -n "$CLUSTER" ]; then
    KUBECONFIG_NAME=$(basename "${KUBECONFIG_PATH%.*}")
    echo "${KUBECONFIG_NAME}: ${CLUSTER} ${NAMESPACE}"
else
    echo "No cluster"
fi
