#!/bin/bash
# Apps
apps=(
  Dropbox
  Plex\ Media\ Server
  Mobile\ Mouse\ Server
  iTunes
  
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Opening your Home apps"
open -g -a ${apps[@]}