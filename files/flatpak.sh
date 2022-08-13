#!/bin/bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo
flatpak install --assumeyes --noninteractive flathub flathub org.gimp.GIMP
flatpak install --assumeyes --noninteractive flathub com.discordapp.Discord
flatpak install --assumeyes --noninteractive flathub org.blender.Blender
flatpak install --assumeyes --noninteractive flathub com.github.Anuken.Mindustry
flatpak install --assumeyes --noninteractive flathub io.bassi.Amberol
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Authenticator
flatpak install --assumeyes --noninteractive flathub com.obsproject.Studio
flatpak install --assumeyes --noninteractive flathub com.gitlab.guillermop.MasterKey
flatpak install --assumeyes --noninteractive flathub info.febvre.Komikku
flatpak install --assumeyes --noninteractive flathub io.github.mpobaschnig.Vaults
flatpak install --assumeyes --noninteractive flathub org.gabmus.whatip
flatpak install --assumeyes --noninteractive flathub org.gnome.Solanum
flatpak install --assumeyes --noninteractive flathub sh.ppy.osu
flatpak install --assumeyes --noninteractive flathub com.github.johnfactotum.QuickLookup
flatpak install --assumeyes --noninteractive flathub org.gnome.World.PikaBackup
flatpak install --assumeyes --noninteractive flathub com.mattjakeman.ExtensionManager
flatpak install --assumeyes --noninteractive flathub app.drey.Warp
#flatpak install --assumeyes --noninteractive flathub org.gabmus.gfeeds
flatpak install --assumeyes --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install --assumeyes --noninteractive flathub app.drey.Dialect
flatpak install --assumeyes --noninteractive flathub org.gnome.Firmware
flatpak install --assumeyes --noninteractive flathub com.lakoliu.Furtherance
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Decoder
flatpak install --assumeyes --noninteractive flathub com.github.tchx84.Flatseal
flatpak install --assumeyes --noninteractive flathub com.github.tenderowl.frog
flatpak install --assumeyes --noninteractive flathub io.posidon.paper
flatpak install --assumeyes --noninteractive flathub com.usebottles.bottles


sudo flatpak override com.usebottles.bottles --filesystem=xdg-data/applications
sudo flatpak override com.usebottles.bottles --filesystem=~/.local/share/Steam
sudo flatpak override com.usebottles.bottles --filesystem=~/.var/app/com.valvesoftware.Steam/data/Steam
