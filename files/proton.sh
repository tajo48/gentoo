#!/bin/bash
#Xar55 script to update the protonGE
latestGE=$(curl --silent "https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest" | jq -r .tag_name)
rm -rf ~/.steam/root/compatibilitytools.d/
mkdir -p ~/.steam/root/compatibilitytools.d/
cd ~/.steam/root/compatibilitytools.d/
wget "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${latestGE}/${latestGE}.tar.gz"
tar -xvf "${latestGE}.tar.gz"
rm "${latestGE}.tar.gz"
