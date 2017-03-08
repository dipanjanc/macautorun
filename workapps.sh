#!/bin/bash
# Apps
apps=(
  Google\ Chrome
  Fantastical
  Evernote
  MindNode
  Messages
  DeskChat
  Sublime
  Sublime\ Text

)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Opening your Home apps"
open -g -a ${apps[@]}