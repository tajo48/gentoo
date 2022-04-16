#!/bin/bash
#Xar55 script to update the protonGE

latestGE=$(curl --silent "https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest" | jq -r .tag_name)
if  [ -d "/home/tajo48/.steam/root/compatibilitytools.d/$latestGE" ]
then
    echo "ProtonGE is up to date"
    exit 1
else
    echo "ProtonGE is outdated, updating"
    rm -rf /home/tajo48/.steam/root/compatibilitytools.d/
    mkdir -p /home/tajo48/.steam/root/compatibilitytools.d/
    cd /home/tajo48/.steam/root/compatibilitytools.d/
    wget "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${latestGE}/${latestGE}.tar.gz"
    tar -xvf "${latestGE}.tar.gz"
    rm "${latestGE}.tar.gz"
fi