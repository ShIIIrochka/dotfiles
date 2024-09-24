#!/bin/bash

# Директория с обоями
WALLPAPER_DIR="/home/$USER/wallpapers"

# Используем rofi для выбора обоев
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | rofi -dmenu -i -p "Select Wallpaper:")

# Если файл выбран
if [ -n "$SELECTED_WALLPAPER" ]; then
    # Устанавливаем обои с помощью nitrogen
    nitrogen --force-setter=xwindows --set-zoom-fill --save "$WALLPAPER_DIR/${WALLPAPER}"
else
    echo "No wallpaper selected."
fi
