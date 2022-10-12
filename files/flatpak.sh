#!/bin/bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo
sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

flatpak install --assumeyes --noninteractive --user flathub flathub org.gimp.GIMP
flatpak install --assumeyes --noninteractive --user flathub com.discordapp.Discord
flatpak install --assumeyes --noninteractive --user flathub org.blender.Blender
flatpak install --assumeyes --noninteractive --user flathub io.bassi.Amberol
flatpak install --assumeyes --noninteractive --user flathub com.belmoussaoui.Authenticator
flatpak install --assumeyes --noninteractive --user flathub com.obsproject.Studio
flatpak install --assumeyes --noninteractive --user flathub com.gitlab.guillermop.MasterKey
flatpak install --assumeyes --noninteractive --user flathub info.febvre.Komikku
flatpak install --assumeyes --noninteractive --user flathub io.github.mpobaschnig.Vaults
flatpak install --assumeyes --noninteractive --user flathub org.gabmus.whatip
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Solanum
flatpak install --assumeyes --noninteractive --user flathub com.github.johnfactotum.QuickLookup
flatpak install --assumeyes --noninteractive --user flathub org.gnome.World.PikaBackup
flatpak install --assumeyes --noninteractive --user flathub com.mattjakeman.ExtensionManager
flatpak install --assumeyes --noninteractive --user flathub app.drey.Warp
#flatpak install --assumeyes --noninteractive --user flathub org.gabmus.gfeeds <-dont work 100%
flatpak install --assumeyes --noninteractive --user flathub org.onlyoffice.desktopeditors
flatpak install --assumeyes --noninteractive --user flathub app.drey.Dialect
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Firmware
flatpak install --assumeyes --noninteractive --user flathub com.lakoliu.Furtherance
flatpak install --assumeyes --noninteractive --user flathub com.belmoussaoui.Decoder
flatpak install --assumeyes --noninteractive --user flathub com.github.tchx84.Flatseal
flatpak install --assumeyes --noninteractive --user flathub com.github.tenderowl.frog
flatpak install --assumeyes --noninteractive --user flathub io.posidon.Paper
flatpak install --assumeyes --noninteractive --user flathub com.usebottles.bottles
flatpak install --assumeyes --noninteractive --user flathub com.github.ADBeveridge.Raider
#flatpak install --assumeyes --noninteractive --user flathub dev.Cogitri.Health <-crash table flip
flatpak install --assumeyes --noninteractive --user flathub org.gnome.SoundRecorder
flatpak install --assumeyes --noninteractive --user flathub com.github.GradienceTeam.Gradience
flatpak install --assumeyes --noninteractive --user flathub pm.mirko.Atoms
#flatpak install --assumeyes --noninteractive --user flathub app.drey.EarTag <- does not open opus???
#flatpak install --assumeyes --noninteractive --user flathub de.haeckerfelix.Fragments <- give it second chance
#flatpak install --assumeyes --noninteractive --user flathub-beta com.github.marhkb.Pods <- dockermoment
flatpak install --assumeyes --noninteractive --user flathub com.github.alexhuntley.Plots
flatpak install --assumeyes --noninteractive --user flathub com.github.finefindus.eyedropper
#flatpak install --assumeyes --noninteractive --user flathub org.gnome.Glade <- wait
#https://gitlab.gnome.org/sophie-h/key-rack <- wait for flathub release
#https://github.com/fushinari/Wordbook
#https://gitlab.com/rmnvgr/zap
#https://gitlab.gnome.org/GNOME/fractal

#games
flatpak install --assumeyes --noninteractive --user flathub sh.ppy.osu
flatpak install --assumeyes --noninteractive launcher.moe com.gitlab.KRypt0n_.an-anime-game-launcher
flatpak install --assumeyes --noninteractive --user flathub com.heroicgameslauncher.hgl
#flatpak install --assumeyes --noninteractive --user flathub io.github.achetagames.epic_asset_manager <-crash table flip
flatpak install --assumeyes --noninteractive --user flathub com.github.Anuken.Mindustry


#config
sudo flatpak override com.usebottles.bottles --filesystem=xdg-data/applications
sudo flatpak override com.usebottles.bottles --filesystem=~/.local/share/Steam
sudo flatpak override com.usebottles.bottles --filesystem=~/.var/app/com.valvesoftware.Steam/data/Steam
