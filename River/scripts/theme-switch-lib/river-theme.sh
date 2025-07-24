#!/bin/bash

theme="$1"

colors="$XDG_CACHE_HOME/colors/$theme.txt"

if [ ! -f "$colors" ]; then
	echo "River: theme $theme not found!"
	exit 1
fi

# Agarrar los hex, agregar 0x y sacarle el #
# #rrggbb -> 0xrrggbb
bg="0x$(sed -n '1p' "$colors" | cut -c2-)"	# Background
focus="0x$(sed -n '18p' "$colors" | cut -c2-)"	# Special
unfocus="0x$(sed -n '9p' "$colors" | cut -c2-)"	# Gray8
urgent="0x$(sed -n '10p' "$colors" | cut -c2-)"	# Red9

riverctl background-color "$bg"
riverctl border-color-focused "$focus"
riverctl border-color-unfocused "$unfocus"
riverctl border-color-urgent "$urgent"

echo "River: using $theme theme."
