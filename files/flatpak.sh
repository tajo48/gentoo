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
#flatpak install --assumeyes --noninteractive flathub com.hunterwittenborn.Celeste # nextcloud
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Authenticator # 2fa
flatpak install --assumeyes --noninteractive flathub com.gitlab.guillermop.MasterKey # keygen1
flatpak install --assumeyes --noninteractive flathub com.github.alexkdeveloper.forgetpass # keygen2
flatpak install --assumeyes --noninteractive flathub io.github.mpobaschnig.Vaults
flatpak install --assumeyes --noninteractive flathub org.gnome.World.PikaBackup
flatpak install --assumeyes --noninteractive flathub app.drey.KeyRack

#entertainment
flatpak install --assumeyes --noninteractive flathub io.bassi.Amberol
flatpak install --assumeyes --noninteractive flathub info.febvre.Komikku

#discipline and health
flatpak install --assumeyes --noninteractive flathub com.rafaelmardojai.Blanket
#flatpak install --assumeyes --noninteractive flathub dev.Cogitri.Health # Wait for it to be standalone + it would be cool to have vr activity support

#OS tools
flatpak install --assumeyes --noninteractive flathub com.mattjakeman.ExtensionManager
flatpak install --assumeyes --noninteractive flathub app.drey.Warp
#flatpak install --assumeyes --noninteractive flathub org.gnome.Firmware #useless
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Decoder
flatpak install --assumeyes --noninteractive flathub com.github.tchx84.Flatseal
flatpak install --assumeyes --noninteractive flathub com.usebottles.bottles #wine on steroids
flatpak install --assumeyes --noninteractive flathub com.github.ADBeveridge.Raider #File Shredder
flatpak install --assumeyes --noninteractive flathub com.github.GradienceTeam.Gradience #MAKE USE OF CLI TOOL
#flatpak install --assumeyes --noninteractive flathub de.haeckerfelix.Fragments #qbitorrent but with bugs and bad ui
#flatpak install --assumeyes --noninteractive flathub pm.mirko.Atoms # Linux bottles 
#flatpak install --assumeyes --noninteractive flathub app.drey.EarTag # not that useful after all
#flatpak install --assumeyes --noninteractive flathub com.dec05eba.gpu_screen_recorder
#flatpak install --assumeyes --noninteractive flathub com.feaneron.Boatswain #buy Stream Deck
#work
flatpak install --assumeyes --noninteractive flathub org.nickvision.money #Manage your personal finances
#flatpak install --assumeyes --noninteractive flathub com.lakoliu.Furtherance #work like solanum

#school
flatpak install --assumeyes --noninteractive flathub com.github.alexhuntley.Plots
flatpak install --assumeyes --noninteractive flathub org.gnome.Solanum #pomodoro
flatpak install --assumeyes --noninteractive flathub io.posidon.Paper #markdown note
flatpak install --assumeyes --noninteractive flathub com.github.flxzt.rnote #paint note
flatpak install --assumeyes --noninteractive flathub app.drey.Dialect #translate
flatpak install --assumeyes --noninteractive flathub com.github.johnfactotum.QuickLookup

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
flatpak install --assumeyes --noninteractive flathub org.gnome.SoundRecorder
flatpak install --assumeyes --noninteractive flathub fr.romainvigier.zap # soundboard

#games
flatpak install --assumeyes --noninteractive flathub sh.ppy.osu
flatpak install --assumeyes --noninteractive launcher.moe com.gitlab.KRypt0n_.an-anime-game-launcher
flatpak install --assumeyes --noninteractive flathub com.heroicgameslauncher.hgl
flatpak install --assumeyes --noninteractive flathub org.prismlauncher.PrismLauncher
flatpak install --assumeyes --noninteractive flathub com.github.Anuken.Mindustry
#flatpak install --assumeyes --noninteractive flathub io.github.Foldex.AdwSteamGtk #steam GTK UI

#config
sudo flatpak override com.usebottles.bottles --filesystem=xdg-data/applications
sudo flatpak override com.usebottles.bottles --filesystem=~/.local/share/Steam
