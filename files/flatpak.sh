#!/bin/bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo
sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

#tools
flatpak install --assumeyes --noninteractive flathub org.gimp.GIMP
flatpak install --assumeyes --noninteractive flathub com.discordapp.Discord
flatpak install --assumeyes --noninteractive flathub org.blender.Blender
flatpak install --assumeyes --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install --assumeyes --noninteractive flathub com.github.tenderowl.frog

#security and backup
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Authenticator
flatpak install --assumeyes --noninteractive flathub com.gitlab.guillermop.MasterKey
flatpak install --assumeyes --noninteractive flathub io.github.mpobaschnig.Vaults
flatpak install --assumeyes --noninteractive flathub org.gnome.World.PikaBackup
# https://gitlab.gnome.org/sophie-h/key-rack # wait for flathub release (no chance)

#entertainment
flatpak install --assumeyes --noninteractive flathub io.bassi.Amberol
flatpak install --assumeyes --noninteractive flathub info.febvre.Komikku

#discipline
flatpak install --assumeyes --noninteractive flathub org.gnome.Solanum
flatpak install --assumeyes --noninteractive flathub com.lakoliu.Furtherance
flatpak install --assumeyes --noninteractive flathub com.rafaelmardojai.Blanket
#flatpak install --assumeyes --noninteractive flathub dev.Cogitri.Health # No phone

#OS tools
flatpak install --assumeyes --noninteractive flathub com.mattjakeman.ExtensionManager
flatpak install --assumeyes --noninteractive flathub app.drey.Warp
flatpak install --assumeyes --noninteractive flathub org.gnome.Firmware
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Decoder
flatpak install --assumeyes --noninteractive flathub com.github.tchx84.Flatseal
flatpak install --assumeyes --noninteractive flathub com.usebottles.bottles
flatpak install --assumeyes --noninteractive flathub com.github.ADBeveridge.Raider #File Shredder
flatpak install --assumeyes --noninteractive flathub org.gnome.SoundRecorder
flatpak install --assumeyes --noninteractive flathub com.github.GradienceTeam.Gradience
flatpak install --assumeyes --noninteractive flathub de.haeckerfelix.Fragments
# flatpak install --assumeyes --noninteractive flathub pm.mirko.Atoms # cool but meh
# flatpak install --assumeyes --noninteractive flathub app.drey.EarTag # not that useful after all
#flatpak install --assumeyes --noninteractive flathub com.dec05eba.gpu_screen_recorder

#school
flatpak install --assumeyes --noninteractive flathub com.github.alexhuntley.Plots
flatpak install --assumeyes --noninteractive flathub io.posidon.Paper
flatpak install --assumeyes --noninteractive flathub app.drey.Dialect
flatpak install --assumeyes --noninteractive flathub com.github.flxzt.rnote
##OR
flatpak install --assumeyes --noninteractive flathub com.github.johnfactotum.QuickLookup
# flatpak install --assumeyes --noninteractive flathub com.github.fushinari.Wordbook
##

#dev tools
flatpak install --assumeyes --noninteractive flathub org.gabmus.whatip
flatpak install --assumeyes --noninteractive flathub com.github.finefindus.eyedropper
#flatpak install --assumeyes --noninteractive flathub org.gnome.Glade # gtk
#flatpak install --assumeyes --noninteractive flathub-beta com.github.marhkb.Pods
#flatpak install --assumeyes --noninteractive flathub io.github.achetagames.epic_asset_manager #crash (╯°□°)╯︵ ┻━┻
#flatpak install --assumeyes --noninteractive flathub org.gabmus.gfeeds # 2/10 mid rss reader
#flatpak install --assumeyes --noninteractive flathub org.gnome.Fractal # gtk matrix

#studio tools
flatpak install --assumeyes --noninteractive flathub net.sapples.LiveCaptions
flatpak install --assumeyes --noninteractive flathub com.obsproject.Studio
flatpak install --assumeyes --noninteractive flathub fr.romainvigier.zap # soundboard

#games
flatpak install --assumeyes --noninteractive flathub sh.ppy.osu
flatpak install --assumeyes --noninteractive launcher.moe com.gitlab.KRypt0n_.an-anime-game-launcher
flatpak install --assumeyes --noninteractive flathub com.heroicgameslauncher.hgl
flatpak install --assumeyes --noninteractive flathub org.prismlauncher.PrismLauncher
flatpak install --assumeyes --noninteractive flathub com.github.Anuken.Mindustry
# flatpak install --assumeyes --noninteractive flathub io.github.Foldex.AdwSteamGtk

#config
sudo flatpak override com.usebottles.bottles --filesystem=xdg-data/applications
sudo flatpak override com.usebottles.bottles --filesystem=~/.local/share/Steam