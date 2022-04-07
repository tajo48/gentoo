#!/bin/bash
options="Poweroff\nXstop\nVirtualbox"
chosen=$(echo -e "$options" | dmenu -i)


case "$chosen" in
    Xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f min.sh) &&  sudo killall dwm;;
    Poweroff) chosen=$(echo -e "now\n-r now" | dmenu -i) && sudo shutdown $chosen ;;
    Virtualbox) sh ~/ARCH/files/vb.sh ;;
esac