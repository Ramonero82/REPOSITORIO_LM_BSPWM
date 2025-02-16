#!/bin/bash

# Confirmar si el usuario quiere proceder con la instalación
read -p "¿Quieres instalar las configuraciones de Linux Mint? (y/n) " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
  echo "Instalación cancelada."
  exit 1
fi

echo "Instalando configuraciones..."

#Instalando lo necesario...
sudo apt update
sudo apt install -y bspwm sxhkd polybar rofi nitrogen

# Copiar configuraciones de Polybar
mkdir -p ~/.config/polybar
cp -r ./mis_configuraciones/.config/polybar/* ~/.config/polybar/
# Scripts de Polybar

cp -r ./mis_configuraciones/.config/scripts/* ~/.config/polybar/scripts/

# Copiar configuraciones de bspwm
mkdir -p ~/.config/bspwm
cp -r ./mis_configuraciones/.config/bspwm/* ~/.config/bspwm/

# Copiar configuraciones de sxhkd
mkdir -p ~/.config/sxhkd
cp -r ./mis_configuraciones/.config/sxhkd/* ~/.config/sxhkd/

# Copiando el tema de rofi
mkdir -p ~/.config/rofi
cp -r ./mis_configuraciones/rofi/* ~/rofi/

#Copiando los temas en Imagenes
mkdir -p ~/Imágenes/wallpapers
cp -r ./mis_configuraciones/Imágenes/wallpapers/* ~/Imágenes/wallpapers

echo "Configuraciones instaladas correctamente."



