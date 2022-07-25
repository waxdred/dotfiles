#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATH="/usr/local/bin:$PATH:/usr/sbin"

show() {
    tmux popup -y0 -x200 -w70 -KER "vi .notes" 
}

show
