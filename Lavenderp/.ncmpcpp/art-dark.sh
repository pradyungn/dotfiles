#!/bin/bash

## Modified By Aditya Shakya.

MUSIC_DIR=/home/pradyungn/Music

COVER=/tmp/cover.jpg

function reset_background
{
    printf "\e]20;;100x100+1000+1000\a"
}

{
    file="$(mpc --format %file% current)"
    ffmpeg -loglevel quiet -y -i /home/pradyungn/Music/"$file" /home/pradyungn/Music/"$file.jpg"

    src="/home/pradyungn/Music/$file.jpg"
    rm -f "$COVER" 
    if [[ -f "$src" ]] ; then
        #resize the image's height to 300px & extent it to cover the urxvt length
        convert "$src" -resize 335x -background "#282a36" -extent 1100x400 "$COVER"
        rm -f "$src"
        if [[ -f "$COVER" ]] ; then        
           
           #no need to scale down, i have extent it
           printf "\e]20;${COVER};100x100+0+0:op=keep-aspect\a"
        else
            reset_background
        fi
    else
        reset_background
    fi
} &
