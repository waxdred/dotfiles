#!/bin/bash

# Configuration API SNCF
API_BASE="https://api.sncf.com/v1"
API_KEY="2ad72756-84f3-4aff-ac95-05a0a829b485"
CONFIG_FILE="$HOME/.config/sketchybar/train_direction"
CACHE_FILE="/tmp/sketchybar_train_cache"
CACHE_DURATION=60  # Cache de 60 secondes

# IDs des stations
LA_HUME_ID="stop_area:SNCF:87582635"        
PESSAC_ALOUETTE_ID="stop_area:SNCF:87581793"

# Couleurs SketchyBar
COLOR_ON_TIME="0xffa6da95"      # Vert
COLOR_DELAYED="0xffeed49f"      # Orange
COLOR_VERY_DELAYED="0xffc6a0f6" # Rouge
COLOR_ERROR="0xff888888"        # Gris
COLOR_BACKGROUND="0xff5b6078"   # Fond semi-transparent

# Icônes Nerd Font pour cohérence avec le thème
ICON_TRAIN="󰔬"
ICON_DELAY="󰀪"
ICON_ERROR="󰅚"

# Nom de l'item SketchyBar
ITEM_NAME="trains"

log_debug() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> /tmp/sketchybar_train_debug.log
}

get_direction() {
    if [[ -f "$CONFIG_FILE" ]]; then
        cat "$CONFIG_FILE"
    else
        echo "la_hume_to_pessac"
    fi
}

toggle_direction() {
    current=$(get_direction)
    if [[ "$current" == "la_hume_to_pessac" ]]; then
        echo "pessac_to_la_hume" > "$CONFIG_FILE"
    else
        echo "la_hume_to_pessac" > "$CONFIG_FILE"
    fi
    log_debug "Direction changée vers: $(get_direction)"
}

get_cached_data() {
    if [[ -f "$CACHE_FILE" ]] && [[ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || stat -f %m "$CACHE_FILE" 2>/dev/null))) -lt $CACHE_DURATION ]]; then
        cat "$CACHE_FILE"
        return 0
    fi
    return 1
}

get_train_data() {
    local from_id="$1"
    local to_id="$2"
    local direction_name="$3"
    
    log_debug "Récupération des données pour $direction_name"
    
    local datetime=$(date '+%Y%m%dT%H%M%S')
    local url="${API_BASE}/coverage/sncf/journeys?from=${from_id}&to=${to_id}&datetime=${datetime}&count=3"
    
    local response=$(curl -s -u "${API_KEY}:" "$url" 2>/dev/null)
    
    if [[ $? -ne 0 ]] || [[ -z "$response" ]]; then
        log_debug "Erreur lors de l'appel API"
        echo '{"error": "api_call_failed"}'
        return 1
    fi
    
    if ! echo "$response" | jq -e '.journeys' >/dev/null 2>&1; then
        log_debug "Réponse API invalide ou pas de journeys"
        log_debug "Structure JSON: $(echo "$response" | jq -c '. | keys' 2>/dev/null || echo "JSON invalide")"
        echo '{"error": "invalid_response"}'
        return 1
    fi
    
    log_debug "Nombre de trajets trouvés: $(echo "$response" | jq '.journeys | length' 2>/dev/null)"
    
    local train_data=$(echo "$response" | jq -r '
        .journeys[0] // empty |
        {
            departure_time: .departure_date_time,
            arrival_time: .arrival_date_time,
            duration: .duration,
            status: (.status // "normal"),
            delay: (.sections[0].departure_date_time_delay // 0),
            from: .sections[0].from.name,
            to: .sections[-1].to.name
        }
    ')
    
    if [[ -z "$train_data" ]] || [[ "$train_data" == "null" ]]; then
        log_debug "Aucun train trouvé"
        echo '{"error": "no_trains"}'
        return 1
    fi
    
    echo "$train_data" > "$CACHE_FILE"
    echo "$train_data"
}

update_sketchybar() {
    local data="$1"
    
    # Traitement des erreurs
    local error=$(echo "$data" | jq -r '.error // empty')
    if [[ -n "$error" ]]; then
        case "$error" in
            "api_call_failed"|"invalid_response")
                sketchybar --set $ITEM_NAME \
                    label="API Error" \
                    icon="$ICON_ERROR" \
                    label.color="$COLOR_ERROR" \
                    icon.color="$COLOR_ERROR" \
                    background.color="$COLOR_BACKGROUND"
                ;;
            "no_trains")
                sketchybar --set $ITEM_NAME \
                    label="Aucun train" \
                    icon="$ICON_TRAIN" \
                    label.color="$COLOR_ERROR" \
                    icon.color="$COLOR_ERROR" \
                    background.color="$COLOR_BACKGROUND"
                ;;
            *)
                sketchybar --set $ITEM_NAME \
                    label="Erreur" \
                    icon="$ICON_ERROR" \
                    label.color="$COLOR_ERROR" \
                    icon.color="$COLOR_ERROR" \
                    background.color="$COLOR_BACKGROUND"
                ;;
        esac
        return
    fi
    
    # Extraction des données
    local departure_time=$(echo "$data" | jq -r '.departure_time // empty')
    local delay=$(echo "$data" | jq -r '.delay // 0')
    local from=$(echo "$data" | jq -r '.from // "?"')
    local to=$(echo "$data" | jq -r '.to // "?"')
    local status=$(echo "$data" | jq -r '.status // "normal"')
    
    if [[ -z "$departure_time" ]]; then
        sketchybar --set $ITEM_NAME \
            label="No data" \
            icon="$ICON_ERROR" \
            label.color="$COLOR_ERROR" \
            icon.color="$COLOR_ERROR" \
            background.color="$COLOR_BACKGROUND"
        return
    fi
    
    # Formatage de l'heure
    local hour_min=$(echo "$departure_time" | sed 's/.*T\([0-9][0-9]\)\([0-9][0-9]\).*/\1:\2/')
    
    # Détermination de l'icône et de la couleur selon le retard
    local icon="$ICON_TRAIN"
    local color="$COLOR_ON_TIME"
    local delay_text=""
    local status_text=""
    
    if [[ "$delay" -gt 0 ]]; then
        icon="$ICON_DELAY"
        delay_text=" (+${delay}min)"
        
        if [[ "$delay" -gt 15 ]]; then
            color="$COLOR_VERY_DELAYED"
        else
            color="$COLOR_DELAYED"
        fi
    fi
    if [[ "$status" != "normal" ]]; then
      status_text=" (${status})"
    else
      status_text=""
    fi
    # Détermination de la direction pour l'affichage
    local direction=$(get_direction)
    local direction_text
    if [[ "$direction" == "la_hume_to_pessac" ]]; then
        direction_text="→ Pessac"
    else
        direction_text="→ La Hume"
    fi
    
    # Mise à jour de SketchyBar
    sketchybar --set $ITEM_NAME \
        label="${hour_min}${delay_text}" \
        icon="$icon" \
        label.color="$color" \
        icon.color="$color" \
        background.color="$COLOR_BACKGROUND"
    
    log_debug "SketchyBar mis à jour: ${from} → ${to} à ${hour_min}${delay_text}"
}

# Gestionnaire d'événements SketchyBar
handle_click() {
    case "$1" in
        "left")
            # Clic gauche: toggle direction et refresh
            toggle_direction
            main
            ;;
        "right")
            # Clic droit: clear cache et refresh
            rm -f "$CACHE_FILE"
            log_debug "Cache vidé"
            main
            ;;
    esac
}

main() {
    # Gestion des événements SketchyBar
    if [[ -n "$SENDER" ]]; then
        case "$SENDER" in
            "mouse.clicked")
                handle_click "$BUTTON"
                return
                ;;
        esac
    fi
    
    # Gestion des arguments en ligne de commande
    case "${1:-}" in
        "toggle")
            toggle_direction
            main
            exit 0
            ;;
        "clear-cache")
            rm -f "$CACHE_FILE"
            log_debug "Cache vidé"
            main
            exit 0
            ;;
    esac
    
    # Vérifier la clé API
    if [[ "$API_KEY" == "VOTRE_CLE_API_SNCF" ]]; then
        sketchybar --set $ITEM_NAME \
            label="No API Key" \
            icon="$ICON_ERROR" \
            label.color="$COLOR_ERROR" \
            icon.color="$COLOR_ERROR" \
            background.color="$COLOR_BACKGROUND"
        exit 1
    fi
    
    # Déterminer la direction
    local direction=$(get_direction)
    local from_id to_id direction_name
    
    if [[ "$direction" == "la_hume_to_pessac" ]]; then
        from_id="$LA_HUME_ID"
        to_id="$PESSAC_ALOUETTE_ID"
        direction_name="La Hume → Pessac Alouette"
    else
        from_id="$PESSAC_ALOUETTE_ID"
        to_id="$LA_HUME_ID"
        direction_name="Pessac Alouette → La Hume"
    fi
    
    # Récupérer et mettre à jour les données
    local train_data=$(get_train_data "$from_id" "$to_id" "$direction_name")
    update_sketchybar "$train_data"
}

main "$@"
