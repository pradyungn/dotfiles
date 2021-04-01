nitrogen --restore

# touchpad settings
xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "SYNA8004:00 06CB:CD8B Touchpad" "libinput Click Method Enabled" 0 1

# MPD
killall -q mpd
while pgrep -u $UID -x mpd >/dev/null; do sleep 1; done

# MPD MPRIS interface
killall mpDris2
while pgrep -u $UID -x mpDris2 >/dev/null; do sleep 1; done

# Kill all polybar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# compton
killall -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Spawning Polybar on all connected monitors
mpd &
mpDris2 &
picom -b
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
  done
else
  polybar -c ~/.config/polybar/config.ini main &
fi
# if type "xrandr"; then
  # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # MONITOR=$m polybar -c ~/.config/polybar/config.ini sub &
  # done
# else
  # polybar -c ~/.config/polybar/config.ini sub &
# fi
