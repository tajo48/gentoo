#!/bin/bash
#passwd password change for all users
username=$USER
if [ "$EUID" -ne 0 ]
then
    read -p 'Device passwd: ' pass
    echo -e "$pass\n$pass" | sudo passwd root
    echo -e "$pass\n$pass" | sudo passwd $username
    exit
else
    echo "Please run as user"
    exit
fi
