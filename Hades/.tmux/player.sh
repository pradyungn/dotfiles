#!/bin/bash

if [  "$(pgrep spotify)" ]; then
    final="$(playerctl -p spotify metadata spotify --format '{{ title }}')"
else
    final="$(playerctl -p mpd metadata spotify --format '{{ title }}')"
fi

cut=$(echo "$final" | cut -d " " -f 1-2)

if [ ${#cut} -lt ${#final} ]; then
    cut+="..."
fi

echo $cut
