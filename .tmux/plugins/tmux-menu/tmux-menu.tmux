#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH="/usr/local/bin:$PATH:/usr/sbin"

main(){
    $(tmux bind-key -T prefix a run -b "source $CURRENT_DIR/scripts/menu.sh && show_menu")
}

main
