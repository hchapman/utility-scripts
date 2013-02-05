#!/bin/bash
## SSHs to the Raspberry Pi and then displays an AppleScript dialog if it is successful.

if (ssh rpi "mpc stop && eject /mnt/hd1")
then 
  osascript <<-EOF
    tell application "System Events"
      activate
      display alert "The disk was ejected successfully and may be removed."
    end tell
EOF
else
  osascript <<-EOF
    tell application "System Events"
      activate
      display alert "There was a problem ejecting the disk. You should manually try the commands."
    end tell
EOF
fi
