#!/bin/bash

msgTag="brightness-indicator"
percent=$(brightnessctl g --machine-readable | cut -d, -f4 | tr -d '%')

dunstify -a "Brillo" -u low -i display-brightness-symbolic \
  -h string:x-dunst-stack-tag:$msgTag \
  -h int:value:"$percent" "Brillo: ${percent}%"
