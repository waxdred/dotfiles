#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH="/usr/local/bin:$PATH:/usr/sbin"

show_menu() {
    $(tmux display-menu -T "#[align=centre fg=cyan]Tmux_Menu" -x R -y P \
        "#[fg=colour202]Copy / Paste" ""\
        "" ""\
        "Copy-mode"           y "run -b 'tmux copy-mode'" \
        "Paste Buffer"        p "run -b 'tmux choose-buffer'" \
        "Popup fzf"           F "run -b '~/.tmux/plugins/tmux-fzf/main.sh'" \
        ""\
        "#[fg=colour202]Split Window" ""\
        "" ""\
        "Split Vertical"     v "run -b 'tmux splitw -h'"\
        "Split Horizontal"   h "run -b 'tmux splitw -v'"\
        "Kill Pane"          k "run -b 'tmux kill-pane'"\
        "#[fg=cyan]For move in Pane alt+arrow" ""\
        "" ""\
        "#[fg=colour202]New Session" ""\
        "" ""\
        "New Session"        c "run -b 'tmux new-window'"\
        "Kill Session"       w "run -b 'tmux kill-window'"\
        "#[fg=cyan]For move in Window shit+arrow           " ""\
        ""\
        "Open note"          n "run -b '~/.tmux/plugins/tmux-note-popup/scripts/tmux-note-popup.sh'"\
        "Prefix + $ for rename Session" ""\
        "" ""\
        "Syncro Pane" ""\
        "" ""\
        "On"                 o "run -b 'tmux setw synchronize-panes on'"\
        "Off"                f "run -b 'tmux setw synchronize-panes off'"\
        "" ""\
        "Reload"             l "run -b 'tmux source ~/.tmux.conf'"\
        "Return"          x "run -b 'source \"$CURRENT_DIR/menu.sh\" && show_menu'" \
        "Close menu"       q "" \
    )
}
