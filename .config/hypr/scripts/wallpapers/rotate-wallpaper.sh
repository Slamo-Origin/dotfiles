#!/bin/bash
# Random wallpaper from collection
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n 1)

if [ -f "$WALLPAPER" ]; then
    swww img "$WALLPAPER" --transition-type grow --transition-fps 60
    notify-send "Wallpaper Changed" "$(basename "$WALLPAPER")" -t 2000
else
    notify-send "Error" "No wallpapers found in $WALLPAPER_DIR" -u critical
fi
