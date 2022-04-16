#!/bin/bash


ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit

if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    echo "ssh key exists"
    cd ~/
    time git clone -b release git@github.com:EpicGames/UnrealEngine.git
    cd ~/UnrealEngine
    time sudo sh Setup.sh
    time sudo sh GenerateProjectFiles.sh
    time sudo make
    time sudo chown tajo48 -R /home/tajo48/UnrealEngine
    sudo rm /usr/local/bin/UnrealEditor
    sudo ln -s /home/tajo48/UnrealEngine/Engine/Binaries/Linux/UnrealEditor /usr/local/bin/UnrealEditor
    echo "Done"
else
    echo "ssh key not found"
    exit 1
fi




