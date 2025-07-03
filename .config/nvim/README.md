# Waxcoin Neovim Configuration

## Overview

This is a modern Neovim configuration focused on providing a powerful and efficient development environment. It includes support for LSP, code completion, AI assistance, debugging, and a variety of language-specific tools.

## Features

- **Modern UI**: Catppuccin theme, custom dashboard, bufferline, and lualine
- **AI Assistance**: Integration with Copilot, Codeium, and CodeCompanion
- **LSP Support**: Configured with Mason for easy installation and management
- **Completion**: Advanced completion with nvim-cmp and various sources
- **Markdown**: Full markdown editing and preview support
- **Remote Editing**: SSH integration for remote development
- **Debugging**: DAP integration for Go and other languages
- **File Navigation**: Telescope and Neo-tree for efficient file browsing
- **Git Integration**: Fugitive for Git operations
- **Code Formatting**: Automatic formatting with conform.nvim
- **Syntax Highlighting**: Treesitter for advanced syntax highlighting

## Key Plugins

### Editor Enhancement
- **lazy.nvim**: Plugin manager
- **telescope.nvim**: Fuzzy finder
- **neo-tree.nvim**: File explorer
- **Comment.nvim**: Easy code commenting
- **nvim-surround**: Surround text operations
- **zen-mode.nvim**: Distraction-free coding

### Development Tools
- **nvim-lspconfig**: LSP configuration
- **mason.nvim**: Package manager for LSP servers
- **nvim-cmp**: Completion engine
- **LuaSnip**: Snippet engine
- **nvim-treesitter**: Advanced syntax highlighting
- **nvim-dap**: Debug Adapter Protocol support
- **conform.nvim**: Automatic formatting
- **nvim-lint**: Linting integration
- **trouble.nvim**: Diagnostics list

### AI Coding Assistance
- **copilot.lua**: GitHub Copilot integration
- **codeium.nvim**: Codeium AI assistant
- **codecompanion.nvim**: AI coding companion

### Language Support
- **go.nvim**: Go development tools
- **markdown-preview.nvim**: Markdown preview
- **nvim-ts-autotag**: Auto close HTML/JSX tags

### Remote Development
- **remote-nvim.nvim**: SSH remote editing

## Installation

1. Ensure you have Neovim 0.9+ installed
2. Clone this repository to your Neovim config directory:
   ```
   git clone https://github.com/waxdred/dotfiles.git ~/.config/nvim
   ```
3. Start Neovim and let lazy.nvim install all plugins

## Key Mappings

- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>fb`: Browse files
- `<leader>rr`: Open file explorer
- `<C-f>`: Tmux sessionizer
- `<C-s>`: SSH connect
- `<C-y>`: Tmux windows
- `<C-n>`: Create new window
- `<C-h>`: Tmux menu

## Customization

The configuration is organized in a modular way:
- `lua/waxcoin/lazy.lua`: Plugin management
- `lua/waxcoin/plugins/`: Plugin configurations
- `lua/waxcoin/keymaps/`: Key mappings
- `lua/waxcoin/core/`: Core settings

Feel free to modify any part to suit your workflow.