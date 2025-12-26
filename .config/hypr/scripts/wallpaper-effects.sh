#!/bin/bash
effect=$(printf "none\nblur\ndim\ninvert" | rofi -dmenu -p "Wallpaper Effect")
case $effect in
    blur) swww img "$(swww query | awk -F 'image: ' '{print $2}')" --transition-blur 20 ;;
    dim) swww img "$(swww query | awk -F 'image: ' '{print $2}')" --transition-brightness 0.5 ;;
    invert) swww img "$(swww query | awk -F 'image: ' '{print $2}')" --invert-y ;;
    *) swww img "$(swww query | awk -F 'image: ' '{print $2}')" ;;
esac
