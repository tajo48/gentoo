#!/bin/bash

if [ -d UnrealEngine ]; then
    echo "cd into UnrealEngine"
    cd UnrealEngine
fi

if [ -f "/usr/local/bin/UnrealEditor" ]; then
    if [ "$(basename $(pwd))" == "UnrealEngine" ]; then
        echo "Update UnrealEngine"
        git pull
        sh GenerateProjectFiles.sh
        make
        sudo chown tajo48 -R $(pwd)
        echo "Update complete"
        exit 1
    fi
fi

if [ "$(basename $(pwd))" == "UnrealEngine" ];
then
    if [ -f "Makefile" ];
    then
        make
        sudo chown tajo48 -R $(pwd)
        sudo ln -s $(pwd)/Engine/Binaries/Linux/UnrealEditor /usr/local/bin/UnrealEditor
        echo "make done (4/4 steps completed)"
    else
        if [ ! -f .ue4dependencies ]; then
            sh Setup.sh
            echo "Setup done (2/4 steps completed)"
        else
            sh GenerateProjectFiles.sh
            echo "GenerateProjectFiles done (3/4 steps completed)"
        fi
    fi
    
else
    echo "UnrealEngine Install Script"
    echo "This process is cut into 4 sections"
    echo "1. Download UnrealEngine"
    echo "2. Setup UnrealEngine"
    echo "3. GenerateProjectFiles"
    echo "4. make"
    echo "Each step requires running unreal-install"
    echo "press enter to continue"
    read
    ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit
    if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
        echo "ssh key exists"
        time git clone -b release git@github.com:EpicGames/UnrealEngine.git
        echo "git clone done (1/4 steps completed)"
    else
        echo "ssh key not found run github-install"
    fi
fi



