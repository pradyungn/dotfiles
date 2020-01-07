nitrogen --restore

#touchpad settings
xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Click Method Enabled" 0 1

#MPD
killall mpd
mpd

#polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#compton
killall compton
compton -b

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini main &
polybar -c ~/.config/polybar/config.ini sub &

#Motivation
shame="$(rofi -dmenu -p "Do you think your effort would get you into UCB/MIT?" -font "UbuntuCondensed 54" -width 95 -lines 0)"

