#!/bin/bash
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%')
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')

if [ "$MUTE" == "yes" ]; then
    echo "󰝟  $VOL"
else
    echo "󰕾  $VOL"
fi
