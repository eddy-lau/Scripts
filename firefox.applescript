on run argv

    tell application "Firefox"

        # Make Firefox frontmost.
        activate

        # Wait until it is truly frontmost.
        repeat while not frontmost
            delay 0.1
        end repeat

        # Open a new window using GUI scripting (requires authorization for assistive access),
        tell application "System Events" to tell application process "Firefox"
            set windowCountBefore to (count of windows)
            # Click on File > New to open a new window, but locate it
            # by keyboard shortcut rather than by name, so as to also work
            # with localized menu names.
            tell menu 1 of menu bar item 3 of menu bar 1
                click (first menu item whose value of attribute "AXMenuItemCmdChar" is "N" and value of attribute "AXMenuItemCmdModifiers" is 0)
            end tell
            # Wait for the new window to appear.
            repeat while (count of windows) = windowCountBefore
                delay 0.2
            end repeat
        end tell

        # Finally, open the URL.
        open location item 1 of argv

    end tell

end run
