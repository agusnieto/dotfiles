#!/bin/bash

theme="$1"

waybar_dir="$XDG_CONFIG_HOME/waybar"
colors="$XDG_CACHE_HOME/colors/$theme.txt"
structure="$waybar_dir/base.css"
output="$waybar_dir/style.css"

if [ ! -f "$colors" ]; then
	echo "Waybar: theme $theme not found!"
	exit 1
fi

get_color() {
	sed -n "${1}p" "$colors"
}

# Colores por renglon
white=$(get_color 16)
black=$(get_color 1)
red=$(get_color 2)
unfocus=$(get_color 9)
focused=$(get_color 16)
base=$(get_color 17)
special=$(get_color 18)

{
	echo "@define-color white $white;"
	echo "@define-color black $black;"
	echo "@define-color red $red;"
	echo "@define-color unfocus $unfocus;"
	echo "@define-color focused $focused;"
	echo "@define-color base $base;"
	echo "@define-color special $special;"
	echo ""
	cat "$structure"
} > "$output"

echo "Waybar: using $theme theme."
