#!/bin/bash

# Confirmar si el usuario quiere proceder con la instalación
read -p "¿Quieres instalar las configuraciones de Linux Mint? (y/n) " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
  echo "Instalación cancelada."
  exit 1
fi

echo "Instalando configuraciones..."

# Instalando lo necesario...
sudo apt update
sudo apt install -y bspwm sxhkd polybar rofi nitrogen

# Usar rsync para copiar las configuraciones de Polybar
mkdir -p ~/.config/polybar
rsync -av ./mis_configuraciones/.config/polybar/ ~/.config/polybar/

# Copiar Scripts de Polybar
mkdir -p ~/.config/polybar/scripts
rsync -av ./mis_configuraciones/.config/scripts/ ~/.config/polybar/scripts/

# Copiar configuraciones de bspwm
mkdir -p ~/.config/bspwm
rsync -av ./mis_configuraciones/.config/bspwm/ ~/.config/bspwm/

# Copiar configuraciones de sxhkd
mkdir -p ~/.config/sxhkd
rsync -av ./mis_configuraciones/.config/sxhkd/ ~/.config/sxhkd/

# Copiando el tema de rofi
mkdir -p ~/.config/rofi
rsync -av ./mis_configuraciones/rofi/ ~/.config/rofi/

# Copiando los temas en Imágenes
mkdir -p ~/Imágenes/wallpapers
rsync -av ./mis_configuraciones/Imágenes/wallpapers/ ~/Imágenes/wallpapers

echo "Configuraciones instaladas correctamente."

