#!/bin/bash

moviedir=${1}
movietime=$(ffprobe -i $moviedir -show_format -v quiet | sed -n 's/duration=//p' | sed 's/\..*$//')
echo "Film time: " $movietime
movierandom=$(shuf -i 1-$movietime -n 1)
echo "Movie random frame:" $movierandom
ffmpeg -y -ss $movierandom -i $moviedir -vframes 1 -q:v 2 ~/ARCH/photos/wallpaper.jpg

