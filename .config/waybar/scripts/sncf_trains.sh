#!/bin/bash
API_BASE="https://api.sncf.com/v1"
API_KEY="ADD YOUR API KEY"
CONFIG_FILE="$HOME/.config/waybar/train_direction"
CACHE_FILE="/tmp/waybar_train_cache"
CACHE_DURATION=60  # Cache de 60 secondes

LA_HUME_ID="stop_area:SNCF:87582635"        
PESSAC_ALOUETTE_ID="stop_area:SNCF:87581793"

# Couleurs pour Waybar
COLOR_ON_TIME="#00ff00"
COLOR_DELAYED="#ff6600"
COLOR_VERY_DELAYED="#ff0000"
COLOR_ERROR="#888888"

# Icônes
ICON_TRAIN=" "
ICON_DELAY="⚠️"
ICON_ERROR="❌"

log_debug() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> /tmp/waybar_train_debug.log
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
}

get_cached_data() {
    if [[ -f "$CACHE_FILE" ]] && [[ $(($(date +%s) - $(stat -c %Y "$CACHE_FILE"))) -lt $CACHE_DURATION ]]; then
        cat "$CACHE_FILE"
        return 0
    fi
    return 1
}

get_train_data() {
    local from_id="$1"
    local to_id="$2"
    local direction_name="$3"
    
    if cached_data=$(get_cached_data); then
        echo "$cached_data"
        return 0
    fi
    
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

format_train_info() {
    local data="$1"
    
    local error=$(echo "$data" | jq -r '.error // empty')
    if [[ -n "$error" ]]; then
        case "$error" in
            "api_call_failed"|"invalid_response")
                echo "{\"text\": \"${ICON_ERROR} API Error\", \"class\": \"error\", \"tooltip\": \"Impossible de récupérer les données SNCF\"}"
                ;;
            "no_trains")
                echo "{\"text\": \"${ICON_TRAIN} Aucun train\", \"class\": \"no-trains\", \"tooltip\": \"Aucun train trouvé\"}"
                ;;
            *)
                echo "{\"text\": \"${ICON_ERROR} Erreur\", \"class\": \"error\", \"tooltip\": \"Erreur inconnue\"}"
                ;;
        esac
        return
    fi
    
    local departure_time=$(echo "$data" | jq -r '.departure_time // empty')
    local delay=$(echo "$data" | jq -r '.delay // 0')
    local from=$(echo "$data" | jq -r '.from // "?"')
    local to=$(echo "$data" | jq -r '.to // "?"')
    
    if [[ -z "$departure_time" ]]; then
        echo "{\"text\": \"${ICON_ERROR} No data\", \"class\": \"error\", \"tooltip\": \"Données invalides\"}"
        return
    fi
    
    local hour_min=$(echo "$departure_time" | sed 's/.*T\([0-9][0-9]\)\([0-9][0-9]\).*/\1:\2/')
    
    local icon="$ICON_TRAIN"
    local css_class="on-time"
    local delay_text=""
    
    if [[ "$delay" -gt 0 ]]; then
        icon="$ICON_DELAY"
        delay_text=" (+${delay}min)"
        
        if [[ "$delay" -gt 15 ]]; then
            css_class="very-delayed"
        else
            css_class="delayed"
        fi
    fi
    
    local direction=$(get_direction)
    local direction_arrow
    if [[ "$direction" == "la_hume_to_pessac" ]]; then
        direction_arrow="→ Pessac"
    else
        direction_arrow="→ La Hume"
    fi
    
    local display_text="${icon} ${hour_min}${delay_text}"
    
    local tooltip="${from} → ${to}\\nDépart: ${hour_min}"
    if [[ "$delay" -gt 0 ]]; then
        tooltip="${tooltip}\\nRetard: ${delay} minutes"
    fi
    
    echo "{\"text\": \"${display_text}\", \"class\": \"${css_class}\", \"tooltip\": \"${tooltip}\"}"
}

main() {
    case "${1:-}" in
        "toggle")
            toggle_direction
            log_debug "Direction changée vers: $(get_direction)"
            exit 0
            ;;
        "clear-cache")
            rm -f "$CACHE_FILE"
            log_debug "Cache vidé"
            exit 0
            ;;
    esac
    
    # Vérifier la clé API
    if [[ "$API_KEY" == "VOTRE_CLE_API_SNCF" ]]; then
        echo "{\"text\": \"${ICON_ERROR} No API Key\", \"class\": \"error\", \"tooltip\": \"Clé API SNCF non configurée\"}"
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
    
    # Récupérer et formater les données
    local train_data=$(get_train_data "$from_id" "$to_id" "$direction_name")
    format_train_info "$train_data"
}

main "$@"
