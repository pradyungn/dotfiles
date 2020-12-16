#!/bin/bash

if [  "$(pgrep spotify)" ]; then
    final="$(playerctl -p spotify metadata spotify --format "\"{{ title }}\" by {{ artist }}")"
else
    IFS="-"
    read -ra mpcarray <<< "$(mpc current)"
    breh="${mpcarray[1]}"
    final="\"${breh:1:100}\" by ${mpcarray[0]}"
fi

if [ ${#final} -le 35 ]; then
    echo $final
else
    echo "${final:0:47}..."
fi
