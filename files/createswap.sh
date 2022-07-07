#!/bin/bash
read -p 'Swap size in G: ' swapsize
swapsize=$(echo $swapsize | sed 's/[^0-9]*//g')
sudo fallocate -l ${swapsize}G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo su << 'NO'
echo "#swap" >> /etc/fstab
echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
NO
