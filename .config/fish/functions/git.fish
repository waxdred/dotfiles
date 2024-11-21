function gcl
    if test (count $argv) -lt 2
        echo "Usage: gcl <host> <repo>"
        return 1
    end

    set host $argv[1]
    set repo $argv[2]
    # Clone le dépôt avec la configuration correcte
    git clone "git@$host:$repo"
end
