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
alias gc='~/.GitSpeak/bin/GitSpeak -answer=8 -max_length=70 -stage' 
#alias gc='~/.GitSpeak/bin/GitSpeak -Ollama -model="mistral" -answer=8 -max_length=30 -stage' 
alias cat="bat --theme=gruvbox-dark -p --paging=never"
alias connect_nas="open smb://10.27.26.107/wax"
alias ku="kubectl"


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


# Functions Encryption
function encrypt_file
    set filename $argv[1]
    sops --encrypt --age (cat $SOPS_AGE_KEY_FILE | grep -oE "public key: (.*)" | sed 's/public key: //') --encrypted-regex '^(data|stringData)$' --in-place $filename
end

function encrypt_env
    set filename $argv[1]
    sops --encrypt --age (cat $SOPS_AGE_KEY_FILE | grep -oE "public key: (.*)" | sed 's/public key: //') -i $filename
end

################################
# Functions Decryption
function decrypt_file_to_apply_kybernetes
    set filename $argv[1]
    sops --decrypt --age (cat $SOPS_AGE_KEY_FILE | grep -oE "public key: (.*)" | sed 's/public key: //') --encrypted-regex '^(data|stringData)$' --in-place $filename | kubectl apply -f -
end

function decrypt_file
    set filename $argv[1]
    sops --decrypt --age (cat $SOPS_AGE_KEY_FILE | grep -oE "public key: (.*)" | sed 's/public key: //') --encrypted-regex '^(data|stringData)$' --in-place $filename
end

function decrypt_env
    set filename $argv[1]
    sops --decrypt --age (cat $SOPS_AGE_KEY_FILE | grep -oE "public key: (.*)" | sed 's/public key: //') -i $filename
end

################################

function decrypt_file_hide
    set filename $argv[1]
    sops --decrypt --age (cat $SOPS_AGE_KEY_FILE | grep -oE "public key: (.*)" | sed 's/public key: //') --encrypted-regex '^(data|stringData)$' --in-place $filename >> .decryp-$filename
end

export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim
export SHELL=/opt/local/bin/fish
export SOPS_AGE_KEY_FILE="$HOME/.sops/key.txt"
export NVM_DIR=~/.nvm
set PATH $PATH ~/code/Go/GoHotReload/
set PATH $PATH /Users/wax/.GitSpeak/bin
set PATH $PATH /Users/wax/.cargo/bin

function tmux-sessionizer
    sh ~/.dotfiles/.config/bin/tmux-sessionizer
end

function ssh-connect
    sh ~/.dotfiles/.config/bin/ssh-connect
end

bind \cf tmux-sessionizer
bind \cs ssh-connect
bind \cy tmux-windows
bind \cn create_new_window
bind \ch tmux-menu

# set theme_color_scheme solarized
set -U FZF_COMPLETE 2
set theme_color_scheme solarized

tmux
source ~/.config/fish/key.sh
zoxide init fish | source
set fish_function_path $fish_function_path ~/.config/fish/functions
