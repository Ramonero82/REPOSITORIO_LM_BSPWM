#!/bin/bash

# Confirmar si el usuario quiere proceder con la instalación
read -p "¿Quieres instalar las configuraciones de Linux Mint? (S/n): " confirm
confirm=${confirm:-S}  # Si se presiona Enter, se considera 'S' como respuesta afirmativa

if [[ ! $confirm =~ ^[Ss]$ ]]; then
  echo "Instalación cancelada."
  exit 1
fi

echo "Instalando configuraciones..."

# Instalando lo necesario...
sudo apt update
sudo apt install -y bspwm sxhkd polybar rofi nitrogen

# Usar rsync para copiar las configuraciones de Polybar
mkdir -p ~/.config/polybar
rsync -av ./mis_configuraciones/.config/polybar/config.ini ~/.config/polybar/
rsync -av ./mis_configuraciones/.config/polybar/launch.sh ~/.config/polybar/
# Copiar Scripts de Polybar
mkdir -p ~/.config/polybar/scripts
rsync -av ./mis_configuraciones/.config/scripts/volume-bar.sh ~/.config/polybar/scripts/

# Copiar configuraciones de bspwm
mkdir -p ~/.config/bspwm
rsync -av ./mis_configuraciones/.config/bspwm/bspwmrc ~/.config/bspwm/

# Copiar configuraciones de sxhkd
mkdir -p ~/.config/sxhkd
rsync -av ./mis_configuraciones/.config/sxhkd/sxhkdrc ~/.config/sxhkd/
rsync -av ./mis_configuraciones/.config/sxhkd/power_off.sh ~/.config/sxhkd/

# Copiando el tema de rofi
mkdir -p ~/.config/rofi
rsync -av ./mis_configuraciones/rofi/Dracula_1.rasi ~/.config/rofi/

# Copiando los temas en Imágenes
mkdir -p ~/Imágenes/wallpapers
rsync -av ./mis_configuraciones/Imágenes/wallpapers/wp11620623-dracula.png ~/Imágenes/wallpapers
rsync -av ./mis_configuraciones/Imágenes/wallpapers/wp11620627-dracula.jpg ~/Imágenes/wallpapers

echo "Configuraciones instaladas correctamente."

