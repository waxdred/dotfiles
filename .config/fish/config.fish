alias 42="cd ~/code/42/$1"
alias sfish "source ~/.dotfiles/.config/fish/config.fish"
alias stmux "source ~/.dotfiles/.tmux.conf"
alias vig "vi +G"
alias vi "nvim"
alias touch2 "~/.dotfiles/.config/fish/touch2 $1"
alias chat "~/code/Term_ChatGPT/bin/chatGPT"

alias sshOxirs "ssh oxiris"

alias dotfile=dotfile


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

function dotfile
    gum style\
        --border normal\
        --margin "1"\
        --border-foreground "$GIT_COLOR"\
        " Dotfile Manager "
    set choose (gum choose --no-limit "Nvim" "Fish" "Config" "Plugin" "Lsp")
    switch $choose
        case "Nvim"
            cd ~/.dotfiles/.config/nvim
        case "Fish"
            cd ~/.dotfiles/.config/fish
        case "Config"
            cd ~/.dotfiles/.config/
        case "Plugin"
            cd ~/.dotfiles/.config/nvim/lua/
        case "Lsp"
            cd ~/.dotfiles/.config/nvim/lua/lsp/
    end
end

set theme_color_scheme solarized
set -U FZF_COMPLETE 2
