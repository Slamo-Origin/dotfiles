#!/bin/bash
STATE=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1{print $2}')
if [ "$STATE" = "1" ]; then
    hyprctl keyword decoration:blur:enabled 0
    notify-send "Blur" "Disabled"
else
    hyprctl keyword decoration:blur:enabled 1
    notify-send "Blur" "Enabled"
fi
