#!/bin/bash

CHOSEN=$(printf "mocha\nmacchiato\nfrappe\nlatte" | rofi -dmenu -i -p "Select Theme")

if [ -z "$CHOSEN" ]; then
    exit 0
fi

notify-send "Theme Switcher" "Switching to $CHOSEN..." -t 1000

# Update the symlink
ln -sf "$HOME/.config/hypr/themes/colors/$CHOSEN.conf" "$HOME/.config/hypr/themes/colors/active.conf"

# Update GTK theme
case $CHOSEN in
    mocha|macchiato|frappe)
        gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-$CHOSEN-mauve-standard+default"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        ;;
    latte)
        gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-latte-mauve-standard+default"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
        ;;
esac

# Restart waybar to apply theme
killall waybar 2>/dev/null
waybar >/dev/null 2>&1 &

# Restart Hyprland to fully apply theme
hyprctl dispatch exit
