#!/bin/bash
cd ~/
sudo pacman -S --noconfirm wget unzip jre-openjdk
wget tlauncher.org/jar
rm TLauncher-*.jar
unzip jar
rm jar README*
echo "java -jar ~/TLauncher-*.jar" > ~/Minecraft
sudo chmod +x Minecraft
sudo rm  /usr/local/bin/Minecraft
sudo mv ~/Minecraft /usr/local/bin/Minecraft