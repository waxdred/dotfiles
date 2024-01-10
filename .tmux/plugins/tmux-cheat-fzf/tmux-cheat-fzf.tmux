#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH="/usr/local/bin:$PATH:/usr/sbin"

main(){
    $(tmux bind-key -T prefix c run -b "source ~/.config/tmux/fzf_window_name.sh")
}

main
