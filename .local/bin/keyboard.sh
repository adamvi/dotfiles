#!/bin/sh
# sets custom keyboard settings, run by udev
# create a file in /etc/udev/rules.d/99-keyboard.rules with
# ACTION=="bind", SUBSYSTEM=="usb", ENV{PRODUCT}=="4b4/510/201", RUN+="/bin/su m --command='/home/m/.local/bin/keyboard.sh'"
# replace m with your username and command with path to your command
# replace ENV{PRODUCT} with your product id

# we need to use X11 auth token for the calls otherwise xset and setckbmap won't work
export XAUTHORITY=/home/m/.Xauthority
export DISPLAY=:0

# lock file
lock="/tmp/keyboard.lock"

# lock the file
exec 9>"$lock"
if ! flock -n 9; then
    # script already running
    exit 1
fi

# mouse acceleration off
/usr/bin/xset m 1 1
# makes key repeat faster
/usr/bin/xset r rate 200 80
# sets caps lock to ctrl and holding down right meta key toggles on finnish keyboard (for ä,ö,å)
/usr/bin/setxkbmap -option shift:both_shiftlock -option ctrl:nocaps -option grp:switch -option grp_led:scroll us,fi

# lock file will be unlocked when the script ends
