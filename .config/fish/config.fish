alias 42="cd ~/code/42/$1"
alias sfish "source ~/.dotfiles/.config/fish/config.fish"
alias stmux "source ~/.dotfiles/.tmux.conf"
alias vig "vi +G"
alias g "lazygit"
alias vi nvim
alias touch2 "~/.dotfiles/.config/fish/touch2 $1"
alias chat "~/code/Term_ChatGPT/bin/chatGPT"
alias code "cd ~/code"

alias sshOxirs "ssh oxiris"
alias sshconf "cat ~/.ssh/config"

alias dot=dotfile


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


if type -q exa
    alias ls "exa -g --icons"
    alias ll "exa -l -g --icons"
    alias lla "exa -la -g --icons"
    alias lt "ll --tree --level=3 -a --ignore-glob='\.*'"
end

export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim
export SHELL=/opt/local/bin/fish
export OPENAI_API_KEY="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"
export NVM_DIR=~/.nvm
set PATH $PATH ~/code/Go/GoHotReload/

# function create_new_window
#     read query
#
#     tmux new-window -n $query
# end

function tmux-sessionizer
    sh ~/.dotfiles/.config/bin/tmux-sessionizer
end

bind \cf tmux-sessionizer
bind \cy tmux-windows
bind \cn create_new_window
bind \ch tmux-menu

alias 42="cd ~/code/42/$1"
alias sfish "source ~/.dotfiles/.config/fish/config.fish"
alias stmux "source ~/.dotfiles/.tmux.conf"
alias vig "vi +G"
alias vi nvim
alias touch2 "~/.dotfiles/.config/fish/touch2 $1"
alias chat "~/code/Term_ChatGPT/bin/chatGPT"
alias code "cd ~/code"

alias clearCache "rm -rf ~/.local/state/nvim/swap/*"


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim
export SHELL=/opt/local/bin/fish
export OPENAI_API_KEY="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"
export NVM_DIR=~/.nvm



set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set PATH $PATH ~/code/Go/GoHotReload/

function dotfile
    gum style \
        --border normal \
        --margin 1 \
        --border-foreground "$GIT_COLOR" \
        " Dotfile Manager "
    set choose (gum choose --no-limit "Nvim" "Fish" "Config" "Plugin" "Lsp" "HotConfig")
    switch $choose
        case Nvim
            cd ~/.dotfiles/.config/nvim
        case Fish
            cd ~/.dotfiles/.config/fish
        case Config
            cd ~/.dotfiles/.config/
        case Plugin
            vi ~/.dotfiles/.config/nvim/lua/plugin.lua
        case Lsp
            cd ~/.dotfiles/.config/nvim/lua/lsp/
        case HotConfig
            vi ~/code/Go/GoHotReload/config/config.yml
    end
end

function export_env_vars
    for line in (cat .env)
        if test (count (string split "=" $line)) -eq 2
            set -l key_value (string split "=" $line)
            set -gx $key_value[1] $key_value[2]
        end
    end
end

function dotfile
    gum style \
        --border normal \
        --margin 1 \
        --border-foreground "$GIT_COLOR" \
        " Dotfile Manager "
    set choose (gum choose --no-limit "Nvim" "Fish" "Config" "Plugin" "Lsp" "HotConfig")
    switch $choose
        case Nvim
            cd ~/.dotfiles/.config/nvim
        case Fish
            cd ~/.dotfiles/.config/fish
        case Config
            cd ~/.dotfiles/.config/
        case Plugin
            vi ~/.dotfiles/.config/nvim/lua/plugin.lua
        case Lsp
            cd ~/.dotfiles/.config/nvim/lua/lsp/
        case HotConfig
            vi ~/code/Go/GoHotReload/config/config.yml
    end
end

function export_env_vars
    for line in (cat .env)
        if test (count (string split "=" $line)) -eq 2
            set -l key_value (string split "=" $line)
            set -gx $key_value[1] $key_value[2]
        end
    end
end

# set theme_color_scheme solarized
set -U FZF_COMPLETE 2
set theme_color_scheme solarized

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH



tmux
