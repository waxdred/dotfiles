#!/bin/sh

WINDOW="monitoring"
SESSION_DIR=$(cat "$HOME/.local/share/zomux/.session" 2>/dev/null)

if [ -z "$SESSION_DIR" ] || [ ! -d "$SESSION_DIR" ]; then
  echo "Error: invalid session directory '${SESSION_DIR}'"
  exit 1
fi

# Check if the monitoring window already exists in the current session
if tmux list-windows -F '#{window_name}' 2>/dev/null | grep -q "^${WINDOW}$"; then
  echo "Monitoring window already exists. Switching to it..."
  tmux select-window -t ":${WINDOW}"
  exit 0
fi

# Create a new window rooted at SESSION_DIR
tmux new-window -d -n "$WINDOW" -c "$SESSION_DIR" -t 0

# Build 4 panes, each starting in SESSION_DIR
tmux split-window -h -t ":${WINDOW}.0" -c "$SESSION_DIR"
tmux split-window -v -t ":${WINDOW}.0" -c "$SESSION_DIR"
tmux split-window -v -t ":${WINDOW}.1" -c "$SESSION_DIR"

# Apply tiled layout
tmux select-layout -t ":${WINDOW}" tiled

# Launch tools
tmux send-keys  -t ":${WINDOW}.0" "btop"    Enter
tmux clock-mode -t ":${WINDOW}.1"
tmux send-keys  -t ":${WINDOW}.2" "lazygit" Enter
# tmux send-keys  -t ":${WINDOW}.3" "fish"    Enter

# Switch to the new window
tmux select-window -t ":${WINDOW}"
