#!/bin/sh
mode="$1"

if [ "$mode" = "area" ]; then
  grim -g "$(slurp -d)" - | wl-copy
  notify-send "📋 Captura al portapapeles"
elif [ "$mode" = "save" ]; then
  mkdir -p "$XDG_PICTURES_DIR/Screenshots"
  filename="$XDG_PICTURES_DIR/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S_grim.png')"
  grim -g "$(slurp)" "$filename"
  notify-send "🖼 Captura guardada" "$filename"
fi
