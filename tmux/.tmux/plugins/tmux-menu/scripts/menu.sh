#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH="/usr/local/bin:$PATH:/usr/sbin"

show_menu() {
    $(tmux display-menu -T "#[align=centre fg=cyan]Menu" -x R -y P \
        "Open Tmux"     a "run -b 'source \"$CURRENT_DIR/tmux.sh\" && show_menu'" \
        "Open Vim"      v "run -b 'source \"$CURRENT_DIR/vim.sh\" && show_menu'" \
        ""\
        "Open Brave"      b "run -b 'source \"$CURRENT_DIR/acces.sh\" && brave'" \
        "Open Github"     g "run -b 'source \"$CURRENT_DIR/acces.sh\" && github'" \
        "Open Youtube"    y "run -b 'source \"$CURRENT_DIR/acces.sh\" && youtube'" \
        "" \
        "Close menu"       q "" \
    )
}
