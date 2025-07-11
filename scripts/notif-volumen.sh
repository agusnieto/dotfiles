#!/bin/bash

msgTag="volume-indicator"
sink="@DEFAULT_AUDIO_SINK@"

# get volumen actual
vol_line=$(wpctl get-volume "$sink")
vol_percent=$(echo "$vol_line" | grep -oP '\d+(\.\d+)?' | awk '{printf "%d", $1 * 100}')
is_muted=$(echo "$vol_line" | grep -o '\[MUTED\]')

if [[ "$is_muted" == "[MUTED]" || "$vol_percent" -eq 0 ]]; then
    dunstify -a "Volumen" -u low -i audio-volume-muted \
      -h string:x-dunst-stack-tag:$msgTag "Volumen: Silenciado"
else
    dunstify -a "Volumen" -u low -i audio-volume-high \
      -h string:x-dunst-stack-tag:$msgTag \
      -h int:value:"$vol_percent" "Volumen: ${vol_percent}%"
fi
