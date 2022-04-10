#!/bin/bash
cd ~/Git
git clone -b release git@github.com:EpicGames/UnrealEngine.git
cd UnrealEngine
git pull
sudo sh Setup.sh
sudo sh GenerateProjectFiles.sh
sudo sh Build.sh
while true
do
    read -r -p "Are You Sure? [Y/n] " input
    
    case $input in
        [yY][eE][sS]|[yY])
            echo "Yes"
            time sudo make
            break
        ;;
        [nN][oO]|[nN])
            echo "No"
            exit 1
        ;;
        *)
            echo "Invalid input..."
        ;;
    esac
done

echo "Done"
