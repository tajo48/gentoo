#!/bin/bash

if test -r /sys/class/power_supply/BAT0/capacity;
then
	for battery in /sys/class/power_supply/BAT?
	do

	charge_full=$(cat "$battery"/charge_full) || break
	charge_full_design=$(cat "$battery"/charge_full_design) || break
	echo "$( calc "$(echo $charge_full)" / "$(echo $charge_full_design)" *100 | tr "~" " " | tr "." " " | awk '{print $1}' )"
done
fi

