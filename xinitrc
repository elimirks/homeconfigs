#!/bin/bash

#feh --bg-scale /home/elijah/Pictures/wallpapers/koolkat.jpg &
nitrogen --restore &
unclutter -idle 1s &

# Polski programmers dvorak
setxkbmap pl dvp &
xmodmap /home/elijah/.Xmodmap &

# Sound 
pulseaudio --start &

# Multihead
xrandr --output DVI-0 --mode 1920x1080 --pos 1280x0 --rotate normal --output VGA-0 --mode 1280x1024 --pos 0x0 --rotate normal --output HDMI-0 --off &

exec ck-launch-session /usr/bin/ratpoison

