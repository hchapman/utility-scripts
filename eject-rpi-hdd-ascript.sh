#!/bin/bash
## SSHs to the Raspberry Pi and then displays an AppleScript dialog if it is successful.

if [ ssh rpi "/etc/init.d/mpd stop && eject /dev/hd1 && /etc/init.d/mpd start" ];
then 
  osascript << EOF
    tell application "System Events"
      activate
      display dialog "The disk was ejected successfully and may be removed."
    end tell
  EOF
else
  osascript << EOF
    tell application "System Events"
      activate
      display dialog "There was a problem ejecting the disk. You should manually try the commands."
    end tell
  EOF
fi
