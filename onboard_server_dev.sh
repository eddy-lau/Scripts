#/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
osascript $DIR/start_onboard_server.applescript
atom ~/Projects/Onboard/Server
sleep 10s
osascript $DIR/firefox.applescript http://localhost:1337/dashboard/apps/Onboard100/browser/
