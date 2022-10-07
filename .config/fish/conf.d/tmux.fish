if not set -q TMUX
	set PathSession ~/.config/fish/conf.d/sessions
	set PathChoose ~/.config/fish/conf.d/choose
	set sesson (tmux list-sessions | awk '{print $1}' | sed 's/.$//' > "$PathSession")
	set option (echo "Attach-Session New-Session Kill-Session" | tr ' ' '\n)'> "$PathChoose")
	set selected (cat "$PathChoose" | fzf)
	
	if string match -q "New-Session" $selected
		read query
	    	tmux new -s $query
	else if string match -q "Kill-Session" $selected
		set selectedKill (cat "$PathSession" | fzf)
		tmux kill-session -t "$selectedKill"
	else if string match -q "Attach-Session" $selected
		set selectedSession (cat "$PathSession" | fzf)
	    	tmux a -t "$selectedSession"
	end
	rm $PathSession 
	rm $PathChoose 
end
