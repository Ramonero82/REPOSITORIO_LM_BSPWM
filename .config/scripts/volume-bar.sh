#!/bin/bash

# Obtiene el volumen actual
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{print $2}' | tr -d '[:space:]' | sed 's/%//')

# Calcula el largo de la barra
length=$((volume / 10))  # Se asume que la barra será proporcional al volumen (10 barras por 100%)

# Colores para la barra
if [[ $volume -eq 0 ]]; then
  color="#FF0000"  # Rojo si el volumen es 0%
elif [[ $volume -le 50 ]]; then
  color="#FFFF00"  # Amarillo para volúmenes bajos
else
  color="#00FF00"  # Verde para volúmenes altos
fi

# Generar la barra de volumen
echo "%{F$color}$(for i in $(seq 1 $length); do echo -n "|"; done)%{F-}"

