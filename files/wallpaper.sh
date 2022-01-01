#!/bin/bash

[ "$(ls -A ~/Wallpapers)" ] && echo "OK" || echo "No videos in ~/Wallpapers" 
moviename=$(ls ~/Wallpapers | shuf -n 1)
moviedir=$(pwd)"/Wallpapers/"$moviename
movietime=$(ffprobe -i $moviedir -show_format -v quiet | sed -n 's/duration=//p' | sed 's/\..*$//')
movierandom=$(shuf -i 1-$movietime -n 1)
ffmpeg -y -ss $movierandom -i $moviedir -vframes 1 -q:v 2 ~/ARCH/photos/wallpaper.jpg

