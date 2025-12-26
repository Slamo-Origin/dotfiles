#!/bin/bash
mkdir -p ~/Pictures/wallpapers

# Download Mocha wallpaper once
if [ ! -f ~/Pictures/wallpapers/mocha.png ]; then
  curl -sLo ~/Pictures/wallpapers/mocha.png \
    https://raw.githubusercontent.com/catppuccin/wallpapers/main/Catppuccin-Mocha.png
fi

# Start daemon if not running
if ! pgrep -x swww-daemon >/dev/null; then
  swww-daemon --format xrgb &
  sleep 0.5
fi

# Set wallpaper
swww img ~/Pictures/wallpapers/mocha.png \
  --transition-type grow \
  --transition-fps 144
