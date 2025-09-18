#!/bin/bash
# Couleurs Catppuccin (reprises de votre config)
export RED=0xffed8796
export BLUE=0xff8aadf4
export GREEN=0xffa6da95
export YELLOW=0xffeed49f
export SUBTEXT0=0xffa5adcb

# Fichier temporaire pour stocker le token d'auth (évite de se reconnecter à chaque fois)
TOKEN_FILE="/tmp/zimbra_token"
TOKEN_EXPIRY_FILE="/tmp/zimbra_token_expiry"
LOG_FILE="/tmp/zimbra_email.log"
ZIMBRA_EMAIL_SERVER=$(cat ~/.config/env/ihu-mail-server 2>/dev/null)
ZIMBRA_EMAIL_EMAIL=$(cat ~/.config/env/ihu-mail-email 2>/dev/null)
ZIMBRA_EMAIL_PASSWORD=$(cat ~/.config/env/ihu-mail 2>/dev/null)
ZIMBRA_EMAIL_NAME=$(cat ~/.config/env/ihu-mail-username 2>/dev/null)
# Initialiser le log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] === DÉMARRAGE SCRIPT ZIMBRA ===" >> $LOG_FILE

# Fonction pour obtenir un token d'authentification
get_auth_token() {
    local response
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Tentative d'authentification sur $ZIMBRA_EMAIL_SERVER avec utilisateur: $USERNAME" >> $LOG_FILE
    
    response=$(curl -s -k -X POST "$ZIMBRA_EMAIL_SERVER/service/soap/" \
        -H "Content-Type: text/xml; charset=utf-8" \
        -d "<?xml version=\"1.0\" encoding=\"utf-8\"?>
            <soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\">
              <soap:Body>
                <AuthRequest xmlns=\"urn:zimbraAccount\">
                  <account by=\"name\">$ZIMBRA_EMAIL_EMAIL</account>
                  <password>$ZIMBRA_EMAIL_PASSWORD</password>
                </AuthRequest>
              </soap:Body>
            </soap:Envelope>")
    
    local curl_exit_code=$?
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Auth curl exit code: $curl_exit_code" >> $LOG_FILE
    
    if [[ $curl_exit_code -eq 0 && -n "$response" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Réponse auth (premiers 200 chars): ${response:0:200}" >> $LOG_FILE
        local token=$(echo "$response" | grep -o '<authToken>[^<]*' | cut -d'>' -f2)
        if [[ -n "$token" ]]; then
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Token obtenu avec succès: ${token:0:20}..." >> $LOG_FILE
            echo "$token"
        else
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: Pas de token dans la réponse" >> $LOG_FILE
            return 1
        fi
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: Échec de l'authentification" >> $LOG_FILE
        return 1
    fi
}

# Fonction pour vérifier si le token est encore valide
is_token_valid() {
    if [[ -f "$TOKEN_EXPIRY_FILE" ]]; then
        local expiry=$(cat "$TOKEN_EXPIRY_FILE")
        local current=$(date +%s)
        if [[ $current -lt $expiry ]]; then
            return 0
        fi
    fi
    return 1
}

# Fonction pour obtenir un token valide (réutilise si possible)
get_valid_token() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Vérification du token existant" >> $LOG_FILE
    
    if is_token_valid && [[ -f "$TOKEN_FILE" ]]; then
        local existing_token=$(cat "$TOKEN_FILE")
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Token existant trouvé et valide: ${existing_token:0:20}..." >> $LOG_FILE
        echo "$existing_token"
        return 0
    fi
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Pas de token valide, obtention d'un nouveau" >> $LOG_FILE
    local token
    token=$(get_auth_token)
    if [[ -n "$token" ]]; then
        echo "$token" > "$TOKEN_FILE"
        # Token valide pour 1 heure (3600 secondes)
        echo $(($(date +%s) + 360)) > "$TOKEN_EXPIRY_FILE"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Nouveau token sauvegardé" >> $LOG_FILE
        echo "$token"
        return 0
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: Impossible d'obtenir un token" >> $LOG_FILE
        return 1 
    fi
}

# Fonction pour compter les emails non lus
count_unread_emails() {
    local token=$1
    local response
    local count
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Début count_unread_emails avec token: ${token:0:20}..." >> $LOG_FILE
    
    response=$(curl -s -k -X POST "$ZIMBRA_EMAIL_SERVER/service/soap/" \
        -H "Content-Type: text/xml" \
        -d "<soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\">
              <soap:Header>
                <context xmlns=\"urn:zimbra\">
                  <authToken>$token</authToken>
                  <account by=\"name\">$ZIMBRA_EMAIL_EMAIL</account>
                </context>
              </soap:Header>
              <soap:Body>
                <SearchRequest xmlns=\"urn:zimbraMail\">
                  <query>in:inbox</query>
                </SearchRequest>
              </soap:Body>
            </soap:Envelope>")
    
    local curl_exit_code=$?
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Curl exit code: $curl_exit_code" >> $LOG_FILE
    
    if [[ $curl_exit_code -ne 0 ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: Curl a échoué" >> $LOG_FILE
        echo "0"
        return 1
    fi
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Réponse SOAP (premiers 500 chars):" >> $LOG_FILE
    echo "${response:0:500}" >> $LOG_FILE
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ---" >> $LOG_FILE
    
    count=$(echo "$response" | grep -o "u=\"1\"" | wc -l | tr -d ' \n\r\t')
    
    # Vérifier que count est un nombre valide
    if ! [[ "$count" =~ ^[0-9]+$ ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: count n'est pas un nombre valide: '$count', utilisation de 0" >> $LOG_FILE
        count="0"
    fi
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Nombre de f=\"!\" trouvés: '$count'" >> $LOG_FILE
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Fin count_unread_emails" >> $LOG_FILE
    echo "---" >> $LOG_FILE
    
    echo "$count"
}

# Fonction pour obtenir les détails du dernier email (optionnel)
get_latest_email_info() {
    local token=$1
    local response
    
    response=$(curl -s -k -X POST "$ZIMBRA_EMAIL_SERVER/service/soap/" \
        -H "Content-Type: text/xml; charset=utf-8" \
        -d "<?xml version=\"1.0\" encoding=\"utf-8\"?>
            <soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\">
              <soap:Header>
                <context xmlns=\"urn:zimbra\">
                  <authToken>$token</authToken>
                </context>
              </soap:Header>
              <soap:Body>
                <SearchRequest xmlns=\"urn:zimbraMail\">
                  <query>is:unread in:inbox</query>
                  <types>message</types>
                  <sortBy>dateDesc</sortBy>
                  <limit>1</limit>
                </SearchRequest>
              </soap:Body>
            </soap:Envelope>")
    
    if [[ $? -eq 0 && -n "$response" ]]; then
        # Extraire l'expéditeur du dernier email
        echo "$response" | grep -o 'e="[^"]*"' | head -1 | cut -d'"' -f2 | cut -d'<' -f1
    fi
}

# Script principal
main() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] === DÉBUT SCRIPT PRINCIPAL ===" >> $LOG_FILE
    
    # Obtenir un token valide
    AUTH_TOKEN=$(get_valid_token)
    
    if [[ -z "$AUTH_TOKEN" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: Pas de token valide - mise à jour SketchyBar avec erreur" >> $LOG_FILE
        # Erreur de connexion
        sketchybar --set zimbra_email \
                   label="?" \
                   label.color=$RED \
                   icon="󰇮" \
                   icon.color=$RED
        exit 1
    fi
    
    # Compter les emails non lus
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Comptage des emails non lus" >> $LOG_FILE
    UNREAD_COUNT=$(count_unread_emails "$AUTH_TOKEN")
    
    # Nettoyer la valeur (supprimer les espaces, sauts de ligne, etc.)
    UNREAD_COUNT=$(echo "$UNREAD_COUNT" | tr -d '\n\r\t ' | grep -o '^[0-9]*$' || echo "0")
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Résultat final nettoyé: '$UNREAD_COUNT' emails non lus" >> $LOG_FILE
    
    # Vérifier que c'est bien un nombre
    if ! [[ "$UNREAD_COUNT" =~ ^[0-9]+$ ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERREUR: UNREAD_COUNT n'est pas un nombre valide: '$UNREAD_COUNT'" >> $LOG_FILE
        UNREAD_COUNT=0
    fi
    
    # Mettre à jour SketchyBar selon le nombre d'emails
    if [[ "$UNREAD_COUNT" -gt 0 ]]; then
        # Il y a des emails non lus
        if [[ "$UNREAD_COUNT" -gt 99 ]]; then
            DISPLAY_COUNT="99+"
        else
            DISPLAY_COUNT="$UNREAD_COUNT"
        fi
        
        # Changer la couleur selon l'urgence
        if [[ "$UNREAD_COUNT" -gt 10 ]]; then
            COLOR=$RED
            COLOR_NAME="RED"
        elif [[ "$UNREAD_COUNT" -gt 5 ]]; then
            COLOR=$YELLOW
            COLOR_NAME="YELLOW"
        else
            COLOR=$GREEN
            COLOR_NAME="GREEN"
        fi
        
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Mise à jour SketchyBar: label='$DISPLAY_COUNT', couleur=$COLOR_NAME" >> $LOG_FILE
        
        sketchybar --set zimbra_email \
                   label="$DISPLAY_COUNT" \
                   label.color=$COLOR \
                   icon="󰇮" \
                   icon.color=$COLOR
    else
        # Aucun email non lu
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Mise à jour SketchyBar: aucun email non lu (couleur BLUE)" >> $LOG_FILE
        sketchybar --set zimbra_email \
                   label="" \
                   icon="󰇮" \
                   icon.color=$BLUE
    fi
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] === FIN SCRIPT PRINCIPAL ===" >> $LOG_FILE
    echo "" >> $LOG_FILE
}

# Gestion des événements de clic
case "$SENDER" in
    "mouse.clicked")
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Clic détecté - ouverture de Zimbra" >> $LOG_FILE
        open "$ZIMBRA_EMAIL_SERVER"
        ;;
    *)
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Exécution normale du script (SENDER='$SENDER')" >> $LOG_FILE
        main
        ;;
esac
