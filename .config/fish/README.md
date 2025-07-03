# Fish Shell Configuration

## Overview

This is a comprehensive Fish shell configuration designed for developers, with a focus on productivity, security, and integration with tools like tmux, Kubernetes, and encryption utilities.

## Features

- **Modern Shell Experience**: Custom prompt, aliases, and functions
- **Tmux Integration**: Session management and window control
- **Kubernetes Tools**: Functions for managing K8s configurations
- **Encryption Utilities**: SOPS integration for secure file handling
- **Development Tools**: Go, Rust, and Node.js environment setup
- **AI Assistance**: Integration with GitSpeak and ChatGPT
- **Navigation**: Directory jumping with zoxide and custom shortcuts

## Key Components

### Aliases

- **Navigation**: `..`, `...`, `....`, `.....` for quick directory traversal
- **Development**: `vi` (nvim), `g` (lazygit), `code` (cd ~/code)
- **Kubernetes**: `ku` (kubectl)
- **Utilities**: `cat` (bat with theme), `vig` (vi +G), `sfish` (reload config)
- **SSH**: `sshconf` (view SSH config), `config` (edit SSH config)

### Functions

#### Session Management
- **tmux-sessionizer**: Quick session creation and switching
- **c**: Change to the last tmux session directory
- **KUBECONFIG**: Switch Kubernetes contexts

#### Encryption (SOPS)
- **encrypt_file**: Encrypt files with age
- **encrypt_env**: Encrypt environment files
- **decrypt_file**: Decrypt files
- **decrypt_file_to_apply_kybernetes**: Decrypt and apply to Kubernetes
- **decrypt_env**: Decrypt environment files
- **decrypt_file_hide**: Decrypt to a hidden file

### Environment Variables

- **Editor**: VISUAL and EDITOR set to Neovim
- **API Keys**: Securely loaded from files in ~/.config/env/
- **Development**: GOPATH, GITHUB_TOKEN, GITHUB_USER
- **Security**: SOPS_AGE_KEY_FILE for encryption

### Key Bindings

- **Ctrl+F**: Launch tmux-sessionizer
- **Ctrl+S**: SSH connect
- **Ctrl+Y**: Tmux windows
- **Ctrl+N**: Create new window
- **Ctrl+H**: Tmux menu

### Theme

- Catppuccin Macchiato color scheme
- Enhanced directory listings with exa (icons and colors)

## Installation

1. Ensure Fish shell is installed
2. Clone this repository to your Fish config directory:
   ```
   git clone https://github.com/waxdred/dotfiles.git ~/.config/fish
   ```
3. Install required tools:
   - tmux
   - exa
   - bat
   - zoxide
   - sops
   - kubectl (if using Kubernetes features)

## Usage Tips

- Use `c` to quickly navigate to your last tmux session directory
- Press Ctrl+F to launch the tmux sessionizer
- Use the encryption functions for secure handling of sensitive files
- Source the config with `sfish` after making changes

## Customization

The configuration is organized in a modular way:
- `config.fish`: Main configuration file
- `functions/`: Custom functions
- `completions/`: Tab completion definitions
- `conf.d/`: Startup configuration files
- `themes/`: Color schemes