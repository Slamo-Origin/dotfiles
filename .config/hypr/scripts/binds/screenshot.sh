#!/bin/bash

# Screenshot script for Hyprland
# Usage: screenshot.sh [area|full|window]

SCREENSHOT_DIR="$HOME/Pictures/screenshots"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

case "$1" in
    area)
        # Select area with slurp
        grim -g "$(slurp)" "$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"
        notify-send "Screenshot" "Area captured → $SCREENSHOT_DIR/screenshot_$TIMESTAMP.png" -t 2000
        ;;
    window)
        # Current window
        WINDOW=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$WINDOW" "$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"
        notify-send "Screenshot" "Window captured" -t 2000
        ;;
    full|*)
        # Full screen
        grim "$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"
        notify-send "Screenshot" "Full screen captured" -t 2000
        ;;
esac

# Copy to clipboard
wl-copy < "$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"
notify-send "Screenshot" "Copied to clipboard ✓" -t 1000
