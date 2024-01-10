# Dotfiles Repository

## Overview

This repository contains my personal configurations for `tmux`, `nvim`, and `fish`. It's designed to streamline my development environment and improve productivity.

## Installation

Instructions on how to clone and use these dotfiles in your own setup.

### Tmux

- Description of your `tmux` setup and any special configurations.
- [Tmux Configuration](./.config/tmux/README.md)

### Neovim (NVIM)

- Overview of your `nvim` setup.
- [Nvim Configuration](./.config/nvim/README.md)

### Fish Shell

- Description of your `fish` shell setup.
- [Fish Configuration](./.config/fish/README.md)

## Usage

How to use these configurations effectively.

## Setup

Setup
Clone the Repository:

```fish
git clone https://github.com/waxdred/dotfiles.git
cd dotfiles
Tmux Configuration:
```

Copy the Tmux configuration file to your home directory:

```fish
cp tmux.conf ~/.tmux.conf
Reload Tmux configuration (inside a Tmux session):
```

```fish
tmux source ~/.tmux.conf
Neovim Configuration:
```

Copy the Neovim configuration files to the appropriate directory:

```fish
cp -r nvim ~/.config/nvim
```

Open Neovim and install plugins (if applicable).
Fish Configuration:

Copy the Fish configuration files to the appropriate directory:

```fish
cp -r fish ~/.config/fish
```

Restart the Fish shell for changes to take effect.
