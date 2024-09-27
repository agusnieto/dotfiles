#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?\%|100%')

# Definir el texto de salida
if [ "$BAT" = "100%" ]; then
    echo "󱐋  $BAT  " # Camino por si tengo 100%
    exit 0
fi

# Como se ve el output
echo "󱐋  $BAT  "

# Color urgent o rojo para 5% y naranja para menos de 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
