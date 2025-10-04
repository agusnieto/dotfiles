#!/usr/bin/env bash

theme="$1"

waybar_dir="$XDG_CONFIG_HOME/waybar"
colors="$XDG_CACHE_HOME/colors/$theme.txt"
structure="$waybar_dir/base.css"
output="$waybar_dir/style.css"

if [ ! -f "$colors" ]; then
    echo "Waybar: theme $theme not found!"
    exit 1
fi

names=(
    black red green yellow blue purple aqua gray brgray brred brgreen bryellow brblue brpurple braqua white bg2 special
)

{
	echo "/* Colors ($theme) */"
	i=0
	while IFS= read -r color; do
		name="${names[$i]}"
		printf "@define-color %-8s %s;\n" "$name" "$color"
		((i++))
	done < "$colors"
	echo ""
	cat "$structure"
} > "$output"

echo "Waybar: reloading"

killall waybar
sleep 1
echo "Waybar: starting waybar"
riverctl spawn waybar

echo "Waybar: using $theme theme."
