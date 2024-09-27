#!/bin/bash

# Obtener el porcentaje de brillo actual
BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$(( 100 * BRIGHTNESS / MAX_BRIGHTNESS ))

# Definir los iconos basados en el porcentaje de brillo
if [ "$PERCENTAGE" -le 20 ]; then
    ICON=""   # Bajo
elif [ "$PERCENTAGE" -le 40 ]; then
    ICON="󰃝"   # Moderadamente bajo
elif [ "$PERCENTAGE" -le 70 ]; then
    ICON="󰃞"   # Moderado
elif [ "$PERCENTAGE" -le 90 ]; then
    ICON="󰃟"   # Alto
else
    ICON="󰃠"   # Máximo
fi

# Mostrar el icono y porcentaje
echo "$ICON  $PERCENTAGE%"
