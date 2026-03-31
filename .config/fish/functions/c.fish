function c --description "Change to the last tmux session directory"
    set -l session_path "$HOME/.local/share/zomux/.session"
    if test -f $session_path
        set -l session (cat $session_path)
        if test -d $session
            cd $session
        else
            echo "Session path does not exist: $session"
        end
    else
        echo "No session file found at $session_path"
    end
end
