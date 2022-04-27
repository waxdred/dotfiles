alias build="cp ~/.dotfiles/nvim/.* ."
alias cbuild="sh ~/.build/cppbuild/buil.sh"
alias ccmake="sh ~/.build/cppbuild/ccmake.sh"
alias vi="nvim"
alias cpp="cd ~/42/moduleCPP"
alias val="docker run -it --rm -v $PWD:/42 valgrind:latest /bin/bash "
alias dotfile "cd ~/.dotfiles/.config"
alias sfish "source ~/.dotfiles/.config/fish/config.fish"
alias stmux "source ~/.dotfiles/.tmux.conf"
alias cheat "sh ~/.tmux/plugins/tmux-cheat-fzf/scripts/cheat.sh"

if type -q exa
	alias ls "exa -g --icons"
	alias ll "exa -l -g --icons"
	alias lla "exa -la -g --icons"
	alias lt "ll --tree --level=2 -a"
end
export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim
export SHELL=/opt/local/bin/fish

set theme_color_scheme solarized
