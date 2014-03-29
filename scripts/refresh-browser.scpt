set hostname to "localhost"

tell application "System Events"
    set isChromeRunning to (count of (every process whose bundle identifier is "com.google.chrome")) > 0
    set isSafariRunning to (count of (every process whose bundle identifier is "com.apple.safari")) > 0
end tell

if isChromeRunning
    tell application "Google Chrome" to tell every tab of every window whose URL contains hostname
        reload
    end tell
end if

if isSafariRunning
    tell application "Safari" to tell every tab of every window whose URL contains hostname
        open location (get its URL)
    end tell
end if
