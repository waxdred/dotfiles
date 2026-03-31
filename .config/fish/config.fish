alias sfish "source $HOME/.config/fish/config.fish"
alias vfish "nvim $HOME/.config/fish/config.fish"
alias lg "lazygit"
alias vig "vi +G"
alias g "lazygit" 
alias gb "git branch"
alias vi nvim
alias claudez "claude --settings $HOME/.claude/settings-zai.json"
alias code "cd ~/code"
alias gc '~/.GitSpeak/bin/GitSpeak -answer=5 -max_length=50 -Ollama -model="qwen3-coder" -max_length=30 -OllamaUrl="http://localhost"'
alias gcp ' ~/.GitSpeak/bin/GitSpeak -answer=5 -max_length=50 -Ollama -model="qwen3-coder" -max_length=30 -OllamaUrl="http://localhost" && git push'
alias gp 'git push'
alias obsidian "vi ~/Obsidian/LIRYC-IHU-Vault/ ."
alias save "~/tools/dump/backup_code.sh"


# Clear .DS_Store 
alias clean 'find $HOME -type f -name ".DS_Store" | xargs -I {} rm {} || echo "All .DS_Store files have been removed."'

# Load yabai
alias ys "sudo yabai --load-sa"


alias cd "z"

# Aliases to connect to SMB shares
alias connect_perso "open smb://IHUCFS001/jonathan.milhas"
alias connect_signal "open smb://IHUCFS001/Signal"
alias connect_commun "open smb://IHUCFS001/Commun"
alias conn "$HOME/.config/bin/connector"

# Aliases to go to mounted SMB shares
alias perso "cd /Volumes/jonathan.milhas"
alias signal "cd /Volumes/Signal"
alias commun "cd /Volumes/Commun"

alias ku "kubectl"
alias ll "eza -l --icons=always --color=always"
alias la "eza -la --icons=always --color=always"
alias ls "eza --icons=always --color=always"

## alias service skhd sketchy yabai
alias start "skhd --start-service && yabai --start-service && sketchybar --reload"
alias stop "skhd --stop-service && yabai --stop-service && sketchybar --reload"


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

export VISUAL=/usr/local/nvim/bin/nvim
export EDITOR=/usr/local/nvim/bin/nvim
export SHELL=/opt/homebrew/bin/fish
export NVM_DIR=~/.nvm

# Env Variables from Secrets files
set -x AVANTE_ANTHROPIC_API_KEY (cat $HOME/.config/env/avante_anthropic)
set -x NIKE_RUN (cat $HOME/.config/env/running)
set -x GITHUB_TOKEN (cat $HOME/.config/env/github)
set -x GITHUB_USER "waxdred"
# set -x LLAMA_API_KEY (cat $HOME/.config/env/llama_key)
# set -x OPENAI_API_KEY (cat $HOME/.config/env/open_ai)
# set -x grafana_auth (cat $HOME/.config/env/grafana)
## Setup api key Kimi for opencode
set -x ANTHROPIC_API_KEY (cat $HOME/.config/env/kimi_api)
# set -x SOPS_AGE_KEY_FILE "$HOME/.sops/key.txt"
# set -x SOPS_API_FILE "$HOME/.sops/api.json"
# set -x GITHUB_TOKEN (cat $HOME/.config/env/github)
# set -x GITHUB_USER "waxdred"
# set -x GITPROFILE_CONFIG $HOME/.config/git/config.yaml
set -x GOPATH $HOME/go
set -Ux fish_user_paths $GOPATH/bin $fish_user_paths
set -x LS_COLORS "di=38;5;81:ln=38;5;213:so=38;5;223:pi=38;5;179:ex=38;5;166:bd=38;5;215;1:cd=38;5;216;1:su=38;5;160;1:sg=38;5;202;1:tw=38;5;183:ow=38;5;223"


# Unset env GOROOT if it exists
set -e GOROOT

set PATH $PATH /Users/wax/.cargo/bin
set PATH $PATH /usr/local/nvim/bin
set PATH $PATH $HOME/go/bin/
set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/Library/Python/3.9/bin
set PATH $PATH $HOME/.cargo/bin


function tmux-sessionizer
    sh ~/.config/bin/tmux-sessionizer
end

# bind \cf tmux-sessionizer
bind \cf 'zomux run'
# set theme_color_scheme solarized
set -U FZF_COMPLETE 2
#set theme_color_scheme solarized
set theme_color_scheme "Catppuccin Macchiato"

source "$HOME/.cargo/env.fish"


set fish_function_path $fish_function_path ~/.config/fish/functions
zoxide init fish | source
starship init fish | source
zomux init &> /dev/null

# opencode
fish_add_path /Users/jonathan.milhas/.opencode/bin
