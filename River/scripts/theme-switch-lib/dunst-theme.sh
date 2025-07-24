#!/bin/bash

theme="$1"
colors="$XDG_CACHE_HOME/colors/$theme.txt"
base="$XDG_CONFIG_HOME/dunst/baserc"
target="$XDG_CONFIG_HOME/dunst/dunstrc"

if [ ! -f "$colors" ]; then
	echo "Dunst: theme $theme not found!"
	exit 1
fi

bg="$(sed -n '1p'  "$colors")"
fg="$(sed -n '16p' "$colors")"
frame="$(sed -n '13p' "$colors")" # azul brillante
low="$(sed -n '11p' "$colors")"   # verde brillante
norm="$(sed -n '14p' "$colors")"  # magenta brillante
crit="$(sed -n '10p' "$colors")"  # rojo brillante
bar="$(sed -n '18p' "$colors")"  # especial

{
	cat "$base"
	echo ""
	echo "[global]"
	echo "background = \"$bg\""
	echo "foreground = \"$fg\""
	echo "frame_color = \"$frame\""
	echo "highlight = \"$bar\""
	echo ""
	echo "[urgency_low]"
	echo "frame_color = \"$low\""
	echo ""
	echo "[urgency_normal]"
	echo "frame_color = \"$norm\""
	echo ""
	echo "[urgency_critical]"
	echo "frame_color = \"$crit\""
} > "$target"

pkill dunst && dunst & disown
echo "Dunst: using $theme theme."
