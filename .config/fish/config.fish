alias 42="cd ~/code/42/$1"
alias sfish "source ~/.config/fish/config.fish"
alias vig "vi +G"
alias g "lazygit"
alias vi nvim
alias touch2 "~/.dotfiles/.config/fish/touch2 $1"
alias chat "~/code/Term_ChatGPT/bin/chatGPT"
alias code "cd ~/code"
alias sshconf "cat ~/.ssh/config"
alias config "vi ~/.ssh/config" alias fishconf "vi ~/.config/fish/config.fish"
alias gc='~/.GitSpeak/bin/GitSpeak -answer=10 -max_length=50 -max_length=30'
#alias gc='~/.GitSpeak/bin/GitSpeak -answer=10 -max_length=50 -Ollama -model="qwen2.5-coder" -max_length=30 -OllamaUrl="https://ollama.waxmaker.app" -OllamaApiKey=$LLAMA_API_KEY -stage'
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

export VISUAL=/usr/local/nvim/bin/nvim
export EDITOR=/usr/local/nvim/bin/nvim
export SHELL=/opt/local/bin/fish
export NVM_DIR=~/.nvm

# Env Variables from Secrets files
# set -x LLAMA_API_KEY (cat $HOME/.config/env/llama_key)
# set -x OPENAI_API_KEY (cat $HOME/.config/env/open_ai)


set PATH $PATH ~/code/Go/GoHotReload/
set PATH $PATH ~/.SopsClient/bin/
set PATH $PATH /Users/wax/.GitSpeak/bin
set PATH $PATH /Users/wax/.cargo/bin
set PATH $PATH /Users/wax/.Clone/bin
set PATH $PATH /usr/local/nvim/bin
set PATH $PATH /usr/local/node/bin
set PATH $PATH $HOME/go/bin
set -x GOROOT /usr/local/go

function KUBECONFIG 
    set value $argv[1]
    eval ($HOME/.config/bin/kubeconfig KUBECONFIG=$value)
end

function tmux-sessionizer
    sh ~/.config/bin/tmux-sessionizer
end

bind \cf tmux-sessionizer
bind \cs ssh-connect
bind \cy tmux-windows
bind \cn create_new_window
bind \ch tmux-menu

# set theme_color_scheme solarized
set -U FZF_COMPLETE 2
#set theme_color_scheme solarized
set theme_color_scheme "Catppuccin Macchiato"

tmux
#source ~/.config/fish/key.sh
source ~/.config/fish/functions/k3s.fish
source ~/.config/fish/functions/git.fish
set fish_function_path $fish_function_path ~/.config/fish/functions
zoxide init fish | source
