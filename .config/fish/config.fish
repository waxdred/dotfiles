alias build="cp ~/.dotfiles/nvim/.* ."
alias cbuild="sh ~/.build/cppbuild/buil.sh"
alias ccmake="sh ~/.build/cppbuild/ccmake.sh"
alias vi="~/nvim/bin/nvim"
alias val="docker run -it --rm -v $PWD:/42 valgrind:latest /bin/bash "
alias dotfile "cd ~/.dotfiles/.config"

if type -q exa
	alias ls "exa -g --icons"
	alias ll "exa -l -g --icons"
	alias lla "exa -la -g --icons"
	alias lt "ll --tree --level=2 -a"
end
export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

set theme_color_scheme solarized
