#!/bin/bash

# Script de test pour vérifier les codes de stations SNCF
# Usage: ./test_stations.sh VOTRE_CLE_API

API_KEY="$1"
API_BASE="https://api.sncf.com/v1"

if [[ -z "$API_KEY" ]]; then
    echo "Usage: $0 VOTRE_CLE_API"
    exit 1
fi

echo "🔍 Test des codes de stations SNCF"
echo "=================================="

# Codes trouvés
LA_HUME_ID="stop_area:SNCF:87582635"
PESSAC_ALOUETTE_ID="stop_area:SNCF:87581793"

echo
echo "📍 Test La Hume (87582635)..."
echo "URL: ${API_BASE}/coverage/sncf/stop_areas/${LA_HUME_ID}"
response=$(curl -s -u "${API_KEY}:" "${API_BASE}/coverage/sncf/stop_areas/${LA_HUME_ID}")
if echo "$response" | jq -e '.stop_areas[0].name' >/dev/null 2>&1; then
    name=$(echo "$response" | jq -r '.stop_areas[0].name')
    echo "✅ SUCCÈS: $name"
else
    echo "❌ ÉCHEC: Réponse invalide"
    echo "$response" | head -3
fi

echo
echo "📍 Test Pessac Alouette (87581793)..."
echo "URL: ${API_BASE}/coverage/sncf/stop_areas/${PESSAC_ALOUETTE_ID}"
response=$(curl -s -u "${API_KEY}:" "${API_BASE}/coverage/sncf/stop_areas/${PESSAC_ALOUETTE_ID}")
if echo "$response" | jq -e '.stop_areas[0].name' >/dev/null 2>&1; then
    name=$(echo "$response" | jq -r '.stop_areas[0].name')
    echo "✅ SUCCÈS: $name"
else
    echo "❌ ÉCHEC: Réponse invalide"
    echo "$response" | head -3
fi

echo
echo "🚆 Test de recherche de trajets..."
echo "================================="
datetime=$(date '+%Y%m%dT%H%M%S')
url="${API_BASE}/coverage/sncf/journeys?from=${LA_HUME_ID}&to=${PESSAC_ALOUETTE_ID}&datetime=${datetime}&count=1"
echo "URL: $url"

response=$(curl -s -u "${API_KEY}:" "$url")
if echo "$response" | jq -e '.journeys[0]' >/dev/null 2>&1; then
    echo "✅ SUCCÈS: Trajets trouvés"
    journey=$(echo "$response" | jq -r '.journeys[0]')
    
    departure=$(echo "$journey" | jq -r '.departure_date_time')
    arrival=$(echo "$journey" | jq -r '.arrival_date_time')
    duration=$(echo "$journey" | jq -r '.duration')
    
    echo "   Départ: $departure"
    echo "   Arrivée: $arrival" 
    echo "   Durée: $duration secondes"
    
    # Vérifier s'il y a des informations de retard
    if echo "$journey" | jq -e '.sections[0].departure_date_time_delay' >/dev/null 2>&1; then
        delay=$(echo "$journey" | jq -r '.sections[0].departure_date_time_delay // 0')
        echo "   Retard: $delay secondes"
    fi
else
    echo "❌ ÉCHEC: Aucun trajet trouvé"
    echo "Réponse API:"
    echo "$response" | jq '.' 2>/dev/null || echo "$response"
fi

echo
echo "🔄 Test sens inverse..."
echo "====================="
url="${API_BASE}/coverage/sncf/journeys?from=${PESSAC_ALOUETTE_ID}&to=${LA_HUME_ID}&datetime=${datetime}&count=1"
response=$(curl -s -u "${API_KEY}:" "$url")
if echo "$response" | jq -e '.journeys[0]' >/dev/null 2>&1; then
    echo "✅ SUCCÈS: Trajets sens inverse trouvés"
else
    echo "❌ ÉCHEC: Aucun trajet sens inverse trouvé"
fi

echo
echo "🏁 Test terminé!"
echo "Si tous les tests sont OK, vous pouvez utiliser ces codes dans le script principal."
