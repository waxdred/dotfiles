alias cat "pygmentize"
alias vi="nvim"
alias val="docker run -it --rm -v $PWD:/42 valgrind:latest /bin/bash "
bind \ct '_fzf_search_directory'

if type -q exa
	alias ls "exa -g --icons"
	alias ll "exa -l -g --icons"
	alias lla "exa -la -g --icons"
	alias lt "ll --tree --level=2 -a"
end

if type -q sshpass 
	alias ssh42 "sshpass -p "X3@xmT4ukJLo8.PG" ssh -o StrictHostKeyChecking=no root@95.179.223.236"
	alias sshsend "sshpass -p "X3@xmT4ukJLo8.PG" scp -r 42 root@95.179.223.236:"
end

alias build "sh ~/.script/build.sh"
alias nvimcls "rm ~/.local/share/nvim/swap/*"
alias dotfiles "cd ~/.dotfiles/config"
alias vif "vi (fzf --reverse --prompt '> ' --border --preview 'cat {}')"
