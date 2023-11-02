#! /bin/bash

if [ "$(id -u)" -eq 0 ]; then
	echo "Script is running as root."
	exit 1
fi

if test -f "$HOME/.ssh/id_rsa.pub"; then
	exit 1
fi

read -p 'Device name: ' device
read -p 'Your email: ' email
read -p 'Github username: ' name
device=$(echo $device | sed 's/[^[:alpha:]]//g' | tr '[:upper:]' '[:lower:]' | sed 's/\([a-z]\)\([a-zA-Z0-9]*\)/\u\1\2/g')

echo "Device:               $device"
echo "Email:                $email"
echo "Github username:      $name"

read -rep $'fr?\n' fr
if [[ $fr != "fr" ]]; then
	echo "K"
	exit 0
fi

ping -q -w 1 -c 1 google.com >/dev/null && echo "internet ok" || exit
cd $HOME/ || exit 0
git config --global credential.helper store
git config --global core.editor "nvim"
git config --global user.email $email
git config --global user.name $name
ssh-keygen -t ed25519 -f ~/.ssh/id_rsa -b 4096 -C “$email” -q -N "" -P ""

echo "Gentoo-"$device"-$(date +"%F")" >$HOME/.ssh/name || exit 0
echo "NAME:"
cat $HOME/.ssh/name
echo "KEY:"
cat $HOME/.ssh/id_rsa.pub
