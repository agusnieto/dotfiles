#!/bin/bash

# Obtén el nombre del adaptador de red
INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}')

# Si no hay adaptador, mostrar "No Wi-Fi"
if [ -z "$INTERFACE" ]; then
    echo "󱚼 No Wi-Fi"
    exit 1
fi

# Obtener la calidad de la señal Wi-Fi (en %)
SIGNAL=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

# Obtener el nombre de la red (SSID)
SSID=$(iw dev $INTERFACE link | grep SSID | awk '{print $2}')

# Si no hay conexión, mostrar "Desconectado"
if [ -z "$SSID" ]; then
    echo "󰖪  "
else
    echo "󰖩  $SIGNAL% ~ $SSID "
fi
