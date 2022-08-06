alias build="cp ~/.dotfiles/nvim/.* ."
alias cbuild="sh ~/.build/cppbuild/buil.sh"
alias ccmake="sh ~/.build/cppbuild/ccmake.sh"
alias cctest="sh ~/.build/cppbuild/cctest.sh"
alias vi="nvim"
alias 42="cd ~/42/$1"
alias dotfile "cd ~/.dotfiles/.config"
alias sfish "source ~/.dotfiles/.config/fish/config.fish"
alias stmux "source ~/.dotfiles/.tmux.conf"
alias cheat "sh ~/.tmux/plugins/tmux-cheat-fzf/scripts/cheat.sh"
alias vig "vi +G"
alias check "sh ~/check.sh"
alias gittt "sh ~/Desktop/ignire.sh"

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

set theme_color_scheme solarized
set -U FZF_COMPLETE 2
