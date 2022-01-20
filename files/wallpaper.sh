#!/bin/bash
cd ~/
rm -rf ~/.cache/wal/schemes/
if [ "$(ls -A ~/Wallpapers)" ]
then
    moviename=$(ls ~/Wallpapers | shuf -n 1)
    moviedir=$(pwd)"/Wallpapers/"$moviename
    movietime=$(ffprobe -i $moviedir -show_format -v quiet | sed -n 's/duration=//p' | sed 's/\..*$//')
    movietime=$(calc $movietime - 1)
    movietime=$(echo $movietime | sed 's/ //g')
    movierandom=$(shuf -i 1-$movietime -n 1)
    moviesecdot=$(shuf -i 0-9999 -n 1)
    
    ffmpeg -y -ss $movierandom.$moviesecdot -i $moviedir -vframes 1 -q:v 2 ~/ARCH/photos/wallpaper.jpg
    echo $movietime.$moviesecdot
else
    echo $(pwd)"/Wallpapers/ dir is empty"
fi

