#!/bin/bash

#Make sure script doas not run as sudo
if [ "$EUID" -eq 0 ]; then
	echo "Please do not run as root"
	exit
fi

sudo echo $USER $HOME

export DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0
if [ -d UnrealEngine ]; then
	echo "cd into UnrealEngine"
	cd UnrealEngine || exit 1
fi

if [ -f "/usr/local/bin/UnrealEditor" ]; then
	if [ "$(basename $(pwd))" == "UnrealEngine" ]; then
		echo "Update UnrealEngine"
		git pull
		sh Setup.sh
		echo -e "\n"
		read -p "OK now click YES in --Register Unreal Engine file types?-- prompt and press enter to continue"
		sh GenerateProjectFiles.sh
		make
		sudo chown $USER -R $(pwd)
		echo "Update complete"
		exit 1
	fi
fi

if [ "$(basename $(pwd))" == "UnrealEngine" ]; then
	if [ -f "Makefile" ]; then
		make
		sudo chown $USER -R $(pwd)
		sudo ln -s $(pwd)/Engine/Binaries/Linux/UnrealEditor /usr/local/bin/UnrealEditor
		echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Unreal Engine
Exec=/usr/local/bin/UnrealEditor
Icon=$HOME/UnrealEngine/Engine/Source/Programs/UnrealVersionSelector/Private/Linux/Resources/Icon.png
Terminal=false
Categories=Game;Development;" | sudo tee /usr/share/applications/UnrealEngine.desktop

		echo "make done (4/4 steps completed)"
	else
		if [ ! -f .uedependencies ] && [ ! -f .ue4dependencies ]; then
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
	ping -q -w 1 -c 1 startpage.com >/dev/null && echo "internet ok" || exit
	if test -f "$HOME/.ssh/id_rsa.pub"; then
		echo "ssh key exists"
		time git clone -b release git@github.com:EpicGames/UnrealEngine.git
		echo "git clone done (1/4 steps completed)"
	else
		echo "ssh key not found run github-install"
	fi
fi
