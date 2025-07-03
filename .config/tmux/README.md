# Tmux Configuration

## Overview

This is a comprehensive tmux configuration designed for developers, featuring a modern UI, powerful integrations, and productivity-enhancing features. The setup includes custom scripts for Git branch display, Kubernetes context awareness, and session management.

## Features

- **Modern UI**: Catppuccin-inspired theme with custom status bar
- **Git Integration**: Branch and status display in status bar
- **Kubernetes Integration**: Current context and namespace display
- **Session Management**: Automatic session saving and restoration
- **Enhanced Navigation**: Vim-style keybindings and intuitive shortcuts
- **Clipboard Integration**: Seamless system clipboard support
- **Custom Scripts**: Path display, SSH status, and more

## Key Components

### Core Configuration

- **Prefix**: Set to Ctrl+A for easy access
- **Indexing**: Windows start at 1 instead of 0
- **History**: Increased limit to 1,000,000 lines
- **Escape Time**: Zero delay for responsive usage
- **Clipboard**: System clipboard integration
- **Status Bar**: Positioned at the top (macOS style)
- **Keybindings**: Vim-style navigation in copy mode

### Plugins

- **tpm**: Tmux Plugin Manager
- **tmux-sensible**: Sensible default settings
- **tmux-yank**: Enhanced clipboard functionality
- **tmux-continuum**: Automatic session saving

### Custom Scripts

- **tmux_gitbranch.sh**: Displays current Git branch with status indicator
- **tmux_kubernetes.sh**: Shows current K8s context and namespace
- **tmux_path.sh**: Displays current working directory
- **tmux_prefix.sh**: Custom window prefix indicators
- **get_ip.sh**: Shows current IP address
- **fzf_window_name.sh**: FZF integration for window selection

### Status Bar

- **Left Section**: Session name with prefix indicator
- **Window List**: Custom formatted window tabs with icons
- **Right Section**: Path, Kubernetes context, Git branch, and IP address
- **Colors**: Catppuccin Macchiato theme with custom accent colors

## Installation

1. Ensure tmux is installed
2. Clone this repository to your tmux config directory:
   ```
   git clone https://github.com/waxdred/dotfiles.git ~/.config/tmux
   ```
3. Install TPM (Tmux Plugin Manager):
   ```
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```
4. Install required dependencies:
   - jq (for JSON parsing in scripts)
   - reattach-to-user-namespace (for macOS clipboard)
   - git (for branch display)
   - kubectl (for Kubernetes integration)

5. Start tmux and press `prefix + I` to install plugins

## Key Bindings

- **Prefix**: Ctrl+A
- **Window Navigation**: Shift + Arrow keys
- **Pane Navigation**: Alt + Arrow keys
- **Copy Mode**: Prefix + [ (Vim keybindings)
- **Paste**: Prefix + ]
- **Split Panes**: Prefix + v (vertical), Prefix + h (horizontal)
- **Resize Panes**: Prefix + Alt + Arrow keys

## Integration with Fish Shell

This tmux configuration works seamlessly with the Fish shell configuration:
- The `tmux-sessionizer` function in Fish allows quick session creation
- The `c` function navigates to the last tmux session directory
- Custom key bindings in Fish trigger tmux commands

## Customization

The configuration is organized in a modular way:
- `.tmux.conf`: Main configuration file
- `buffer.conf`: Status bar theme and format
- `tmux.reset.conf`: Reset default settings
- Custom scripts in the main directory
- Additional utilities in the `scripts/` directory