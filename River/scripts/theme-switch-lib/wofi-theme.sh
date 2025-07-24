#!/bin/bash

theme="$1"

wofi_dir="$XDG_CONFIG_HOME/wofi"
colors="$XDG_CACHE_HOME/colors/$theme.txt"
structure="$wofi_dir/base.css"
output="$wofi_dir/style.css"

if [ ! -f "$colors" ]; then
	echo "Wofi: theme $theme not found!"
	exit 1
fi

# Agarrar lineas 17 y 18
base=$(sed -n 17p "$colors")
focus=$(sed -n 18p "$colors")

# Mandarlo al style.css de wofi
{
	echo "@define-color base $base;"
	echo "@define-color focus $focus;"
	echo ""
	cat "$structure"
} > "$output"

echo "Wofi: using $theme theme."
