#!/bin/bash
if pgrep -x "gpu-screen-rec" > /dev/null; then
    killall -SIGINT gpu-screen-recorder
    notify-send "Recording Stopped" "Saved to ~/Videos/ 🎬"
else
    gpu-screen-recorder -w screen -f 60 -a default_output -o ~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4 &
    notify-send "Recording Started" "Recording in progress 🔴"
fi
