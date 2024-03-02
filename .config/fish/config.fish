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
alias config "vi ~/.ssh/config"
alias gc="~/.GitSpeak/bin/GitSpeak"


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
export NVM_DIR=~/.nvm
set PATH $PATH ~/code/Go/GoHotReload/
set PATH $PATH /Users/wax/.GitSpeak/bin
set PATH $PATH /Users/wax/.cargo/bin

function tmux-sessionizer
    sh ~/.dotfiles/.config/bin/tmux-sessionizer
end

bind \cf tmux-sessionizer
bind \cy tmux-windows
bind \cn create_new_window
bind \ch tmux-menu

# set theme_color_scheme solarized
set -U FZF_COMPLETE 2
set theme_color_scheme solarized

tmux
zoxide init fish | source
