#!/bin/bash
options="Poweroff\nXstop\nVirtualbox"
chosen=$(echo -e "$options" | dmenu -i)


case "$chosen" in
    Xstop) sudo kill -9 $(pgrep -f bar.sh) && sudo kill -9 $(pgrep -f min.sh) &&  sudo killall dwm;;
    Poweroff) chosen=$(echo -e "now\n-r now" | dmenu -i) && sudo shutdown $chosen ;;
    Virtualbox) sh ~/ARCH/files/vb.sh ;;
esac



#update=" "$(pacman -Qu | awk '{print $1}') && update=$(echo -e "\n*"$update |  sed 's/ /\n*/g') && install=$(sudo pacman -Ss | grep "^[A-Za-z]" | tr "/" " " | awk '{ print $2}' ) && chosen=$(echo -e $install$update | tr " " "\n" | dmenu -i ) && chosen=$(echo $chosen | tr "\n*" " ") && sudo pacman -S --noconfirm $chosen | dmenu
#chosen=$(sudo pacman -Q | awk '{print $1}' | dmenu -i) && sudo pacman -R --noconfirm $chosen


# Killssh) sudo systemctl stop sshd;;
# Startssh) sudo systemctl start sshd;;
# Disablessh) sudo systemctl disable sshd;;
# Enablessh) sudo systemctl enable sshd;;
