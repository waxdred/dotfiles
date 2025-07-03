function c --description "Change to the last tmux session directory"
    if test -f $HOME/.config/.session
        set -l session_path (cat $HOME/.config/.session)
        if test -d $session_path
            cd $session_path
        else
            echo "Session path does not exist: $session_path"
        end
    else
        echo "No session file found at $HOME/.config/.session"
    end
end
