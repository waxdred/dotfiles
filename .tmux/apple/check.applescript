set appName to "Spotify"

if application appName is running then

    tell application id (id of application appName)
    end tell
    return "Running"
else
    return "Not running"
end if
