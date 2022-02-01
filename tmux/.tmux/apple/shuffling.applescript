if (get running of application "Spotify") then
  tell application "Spotify"
    set track_info to ""
    set track_info to track_info & shuffling & "\n"
    return track_info
  end tell
else
  return ""
end if
