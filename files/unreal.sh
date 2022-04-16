#!/bin/bash
cd ~/
time git clone -b release git@github.com:EpicGames/UnrealEngine.git
cd ~/UnrealEngine
time sudo sh Setup.sh
time sudo sh GenerateProjectFiles.sh
time sudo make
time sudo chown tajo48 -R /home/tajo48/UnrealEngine
sudo ln -s ~/UnrealEngine/Engine/Binaries/Linux/UnrealEditor /usr/local/bin/UnrealEditor

echo "Done"
