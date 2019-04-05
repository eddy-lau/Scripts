tell application "Terminal"

  activate

  # Wait until it is truly frontmost.
  repeat while not frontmost
      delay 0.1
  end repeat

  tell application "System Events" to tell application process "Terminal"

      set windowCountBefore to (count of windows)

      keystroke "n" using command down

      # Wait for the new window to appear.
      repeat while (count of windows) = windowCountBefore
          delay 0.2
      end repeat

      tell application "Terminal"
        do script "cd ~/Projects/Onboard/Server/" in selected tab of the front window
        do script "mongod -f /usr/local/etc/mongod.conf" in selected tab of the front window
      end tell

      delay 1.0

      keystroke "t" using command down

      tell application "Terminal"
        do script "cd ~/Projects/Onboard/Server/" in selected tab of the front window
        do script "nvm use 6" in selected tab of the front window
        do script "npm start" in selected tab of the front window
      end tell

      keystroke "t" using command down

      # tell application "Terminal"
        # do script "cd ~/Projects/Onboard/Server/" in selected tab of the front window
        # do script "atom ." in selected tab of the front window
      # end tell

  end tell

end tell
