#!/bin/bash

if [ "$(basename $(pwd))" == "UnrealEngine" ]; then
    sudo make
    sudo rm /usr/local/bin/UnrealEditor
    sudo ln -s Engine/Binaries/Linux/UnrealEditor /usr/local/bin/UnrealEditor
    echo "All done :)"
else
    echo "outside"
fi


ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit

if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    echo "ssh key exists"
    time git clone -b release git@github.com:EpicGames/UnrealEngine.git
    read -p "Press [Enter] key to continue..."
    time sudo sh Setup.sh
    read -p "Press [Enter] key to continue..."
    time sudo sh GenerateProjectFiles.sh
    echo "Run this script again to build"
else
    echo "ssh key not found"
    exit 1
fi