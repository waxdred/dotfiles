alias build="cp ~/.dotfiles/nvim/.* ."
alias cbuild="sh ~/.build/cppbuild/buil.sh"
alias ccmake="sh ~/.build/cppbuild/ccmake.sh"
alias vi="nvim"
alias vim="nvim"
alias val="docker run -it --rm -v $PWD:/42 valgrind:latest /bin/bash "
alias dotfile "cd ~/.dotfiles/.config"
bind \ct '_fzf_search_directory'

if type -q exa
	alias ls "exa -g --icons"
	alias ll "exa -l -g --icons"
	alias lla "exa -la -g --icons"
	alias lt "ll --tree --level=2 -a"
end

if status is-interactive
and not set -q TMUX
    exec tmux
end

if type -q sshpass 
	alias ssh42 "sshpass -p "X3@xmT4ukJLo8.PG" ssh -o StrictHostKeyChecking=no root@95.179.223.236"
	alias sshsend "sshpass -p "X3@xmT4ukJLo8.PG" scp -r 42 root@95.179.223.236:"
end
export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

set theme_color_scheme solarized-dark
