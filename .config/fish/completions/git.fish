set -l host ( grep -E "^Host git" ~/.ssh/config | awk '{print $2}')

complete -c gcl -e 
complete -f -c gcl
complete -f -c gcl
complete -f -c gcl -a "$host"

