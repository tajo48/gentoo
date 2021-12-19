#!/bin/bash
sh /home/tajo48/ARCH/files/min.sh &
while :
do
statusbat="|"



if test -r /sys/class/power_supply/BAT0/capacity;
then
    for battery in /sys/class/power_supply/BAT?
    do
    capacity=$(cat "$battery"/capacity) || break
    bstatus=$(sed "s/[Dd]ischarging/-/;s/[Nn]ot charging/NO/;s/[Cc]harging/+/;s/[Uu]nknown/NULL/;s/[Ff]ull/F/" "$battery"/status)

statusbat="|"$capacity$bstatus$statusbat
done
fi

setxkbmap -layout 'pl'
xset r rate 300 50

#!/bin/sh

# This script is called on startup to remap keys.
# Increase key speed via a rate change
#xset r rate 300 50
# Map the caps lock key to super...
#setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
#killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
# Map the menu button to right super as well.
#xmodmap -e 'keycode 135 = Super_R'


#setxkbmap -option caps:swapescape


weather="$(cat /home/tajo48/weather  | awk '{print $2}{print $3}' | sed 's/^..//' | tr "\n" " ")"


usedmem="$(vmstat -s | grep "used memory" | awk '{print $1}' )"
allmem="$(vmstat -s | grep "total memory" | awk '{print $1}' )"
mem="$( calc "$(echo $usedmem)" / "$(echo $allmem)" *100 | tr "~" " " | tr "." " " | awk '{print $1}' )"


status="|"$mem"%"$statusbat"$(date +"%F %R" )""|""$(pacman -Qu | wc -l)"" of ""$(pacman -Q | wc -l)"
status="$(echo $status | tr "/n" " ")"
#cp="$(echo countdown to cp2077:$[$[$(date +%s)-$(date -d "2020-12-10 00:00:00" +%s)]/60] | tr "-" " ")"" |"

xsetroot -name "$(echo $weather$status)"
sleep 10s
done
