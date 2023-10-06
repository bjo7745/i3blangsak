#!/bin/env bash

#set resolution
xrandr --output VGA-1 --primary --mode 1360x768_60.00 --pos 0x0 --rotate normal

# Fix cursor
xsetroot -cursor_name left_ptr

#set numlock on startup
numlockx on

# kill if already running
killall -9 nitrogen picom conky dunst autotiling

# Set Wallpaper
nitrogen --restore

# start compositor
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/i3/picom.conf &

# Launch Conky
#conky -c $HOME/.config/conky/Gotham

# Launch notification daemon
dunst -config $HOME/.config/i3/dunst/dunstrc &

# Launch autotiling
autotiling &

#polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# set powersavings for display:
xset s 480 dpms 600 600 600