#!/bin/bash

theme="$1"
colors="$XDG_CACHE_HOME/colors/$theme.txt"
base="$XDG_CONFIG_HOME/foot/base.ini"
output="$XDG_CONFIG_HOME/foot/foot.ini"

if [ ! -f "$colors" ]; then
  echo "Foot: theme $theme not found!"
  exit 1
fi

cp "$base" "$output"

{
  echo ""
  echo "[colors]"
  cursor_b="$(sed -n '18p' "$colors" | tr -d '#')" # bloque
  cursor_t="$(sed -n '17p' "$colors" | tr -d '#')" # texto
  echo "cursor=$cursor_t $cursor_b"

  echo "background=$(sed -n '17p' "$colors" | tr -d '#')"
  echo "foreground=$(sed -n '16p' "$colors" | tr -d '#')"
  echo ""

  echo "## Normal colors"
  for i in $(seq 0 7); do
    color=$(sed -n "$((i+1))p" "$colors" | tr -d '#')
    echo "regular$i=$color"
  done

  echo ""
  echo "## Bright colors"
  for i in $(seq 8 15); do
    color=$(sed -n "$((i+1))p" "$colors" | tr -d '#')
    echo "bright$((i-8))=$color"
  done
} >> "$output"

echo "Foot: using $theme theme."
