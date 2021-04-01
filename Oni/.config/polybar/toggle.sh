if [ $(cat ~/.config/polybar/status) -gt 0 ]; then
    echo 0 > ~/.config/polybar/status
else
    echo 1 > ~/.config/polybar/status
fi
