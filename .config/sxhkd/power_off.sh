#!/bin/sh

# Definir las opciones con iconos
options="🔌 Apagar\n🔄 Reiniciar\n👤 Cerrar sesión\n🔒 Bloquear"

# Mostrar el menú con rofi
chosen=$(printf "$options" | rofi -dmenu -i -p "Elige una opción:")

# Comprobar si se seleccionó una opción
if [ -z "$chosen" ]; then
  exit 1
fi

# Ejecutar la acción correspondiente
case "$chosen" in
  "🔌 Apagar")
    systemctl poweroff
    ;;
  "🔄 Reiniciar")
    systemctl reboot
    ;;
  "👤 Cerrar sesión")
    bspc quit
    ;;
  "🔒 Bloquear")
    cinnamon-screensaver-command -l
    ;;
  *)
    exit 1
    ;;
esac

