#!/usr/bin/env bash

# Uso: porcentaje "a b c d e"
# Ej: ./picker.sh 95 "a b c d e"

percent=$1
shift
read -r -a icons <<< "$@"

len=${#icons[@]}

idx=$(( percent * len / 100 ))

if (( idx >= len )); then
  idx=$((len - 1))
fi

echo "${icons[$idx]}"

