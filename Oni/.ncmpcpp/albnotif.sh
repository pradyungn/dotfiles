#!/bin/bash

#  ____  _   _ 
# |  _ \| \ | | Pradyun Narkadamilli
# | |_) |  \| | https://pradyungn.tech
# |  __/| |\  | MIT License
# |_|   |_| \_| Copyright 2020 Pradyun Narkadamilli

MUSIC_DIR=/home/pradyungn/Music

file="$(mpc --format %file% current)"
ffmpeg -loglevel quiet -y -i /home/pradyungn/Music/"$file" /home/pradyungn/Music/"$file.jpg"

notify-send -i "/home/pradyungn/Music/$file.jpg" "Now Playing ♫" "\n$(mpc current -f '%artist%\n%title% // %time%')"
