#!/bin/bash

# Keybind cheatsheet display with rofi
CHEATSHEET="$HOME/.config/hypr/keybinds/cheatsheet.txt"

if [ -f "$CHEATSHEET" ]; then
    rofi -dmenu \
        -i \
        -p "Keybinds" \
        -theme-str 'window {width: 900px; height: 700px;}' \
        -theme-str 'listview {lines: 30;}' \
        -theme-str 'element-text {font: "JetBrainsMono Nerd Font 11";}' \
        < "$CHEATSHEET"
else
    notify-send "Cheatsheet Error" "File not found: $CHEATSHEET" -u critical
fi
