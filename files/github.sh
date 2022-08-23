#! /bin/bash

if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    exit 1
fi

read -p 'Device name: ' device
read -p 'Your email: ' email
read -p 'Github username: ' name
device=$(echo $device | sed 's/[^[:alpha:]]//g' | tr '[:upper:]' '[:lower:]' | sed 's/\([a-z]\)\([a-zA-Z0-9]*\)/\u\1\2/g')

ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit
cd /home/tajo48
git config --global credential.helper store
git config --global user.email $email
git config --global user.name $name
ssh-keygen -t rsa -f ~/.ssh/id_rsa -b 4096 -C “tajo161626@gmail.com” -q -N "" -P ""

echo "ARCH-"$device"-$(date +"%F")" > /home/tajo48/.ssh/name
echo "NAME:"
cat /home/tajo48/.ssh/name
echo "KEY:"
cat /home/tajo48/.ssh/id_rsa.pub

