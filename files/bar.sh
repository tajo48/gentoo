#!/bin/bash
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
    
    
    
    status=$statusbat"$(date +"%F %R" )"
    status="$(echo $status | tr "/n" " ")"
    #cp="$(echo countdown to cp2077:$[$[$(date +%s)-$(date -d "2020-12-10 00:00:00" +%s)]/60] | tr "-" " ")"" |"
    
    xsetroot -name "$(echo $status)"
    sleep 15s
done
