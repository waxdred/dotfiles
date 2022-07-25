#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH="/usr/local/bin:$PATH:/usr/sbin"

show_menu() {
    $(tmux display-menu -T "#[align=centre fg=cyan]Trick_Vim" -x R -y P \
        "#[align=centre fg=colour202]Add new Tab" ""\
        "" ""\
        ":badd                         add new tab" ""\
        ""\
        "Tab                           tab for change tab" ""\
        ""\
        "ctrl + w and v                split vertical" ""\
        ""\
        "ctrl + w and s                split horizontal" ""\
        ""\
        "Shit + tab                    change window" ""\
        ""\
        ":Lex                          Open Tab dir" ""\
        ""\
        ":g/NAME/d                     Delette all line with pattern" ""\
        "" ""\
        "#[align=centre fg=colour202] Tips Move" ""\
        "" ""\
        "(^)                           start line" ""\
        ""\
        "($)                           end line" ""\
        ""\
        "(H)                           go to the top" ""\
        ""\
        "(M)                           go to middle" ""\
        ""\
        "(L)                           go to middle" ""\
        ""\
        "(t)                           go to the char" ""\
        ""\
        "(T)                           go back to the char" ""\
        ""\
        "ctrl+a or ctrl+x              change first number" ""\
        ""\
        ":call G(\"recherche\")          use grep for found" ""\
        "" ""\
        "#[align=centre fg=colour202] Visual Mode" ""\
        "" ""\
        "ctrl+v                        Visual-block" ""\
        ""\
        "(c)                           Replace selection" ""\
        ""\
        "(i)                           insert to the left" ""\
        ""\
        "(A)                           Append to the right" ""\
        ""\
        "(o)                           Opposite corner" ""\
        ""\
        "(r)                           replace selection to char" ""\
        ""\
        "(R)                           replace Mode" ""\
        "" ""\
        "#[align=centre fg=colour202] Tags" ""\
        "" ""\
        "ctags *                       create file all function" ""\
        ""\
        ":tag function                 go to the function"""\
        """"\
        "" ""\
        "#[align=centre fg=colour202] Save Workspace" ""\
        "" ""\
        ":mksession filename.vim       Save Workspace" ""\
        ""\
        "vim -S filename.vim           Open Workspace    " ""\
        "" ""\
        "Return"           x "run -b 'source \"$CURRENT_DIR/menu.sh\" && show_menu'" \
        "Close menu"       q "" \
    )
}
