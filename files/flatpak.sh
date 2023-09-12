#!/bin/bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
# sudo flatpak remote-add --if-not-exists launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo # Genshin

#tools
flatpak install --assumeyes --noninteractive flathub org.gimp.GIMP
flatpak install --assumeyes --noninteractive flathub io.gitlab.adhami3310.Footage
flatpak install --assumeyes --noninteractive flathub com.discordapp.Discord
flatpak install --assumeyes --noninteractive flathub org.blender.Blender
flatpak install --assumeyes --noninteractive flathub com.github.libresprite.LibreSprite
flatpak install --assumeyes --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install --assumeyes --noninteractive flathub com.github.tenderowl.frog
flatpak install --assumeyes --noninteractive flathub io.github.nokse22.minitext
flatpak install --assumeyes --noninteractive flathub org.gnome.Maps

#security and backup
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Authenticator # 2fa
flatpak install --assumeyes --noninteractive flathub io.github.mpobaschnig.Vaults
#flatpak install --assumeyes --noninteractive flathub com.hunterwittenborn.Celeste # nextcloud
# flatpak install --assumeyes --noninteractive flathub com.gitlab.guillermop.MasterKey # keygen1
# flatpak install --assumeyes --noninteractive flathub com.github.alexkdeveloper.forgetpass # keygen2
# flatpak install --assumeyes --noninteractive flathub org.gnome.World.PikaBackup #backup 1
#flatpak install --assumeyes --noninteractive flathub org.gnome.DejaDup #backup 2
# flatpak install --assumeyes --noninteractive flathub app.drey.KeyRack # keys from apps

#entertainment
flatpak install --assumeyes --noninteractive flathub io.bassi.Amberol
flatpak install --assumeyes --noninteractive flathub dev.geopjr.Tuba #gtk mastodon
flatpak install --assumeyes --noninteractive flathub info.febvre.Komikku
flatpak install --assumeyes --noninteractive flathub de.haeckerfelix.Shortwave
flatpak install --assumeyes --noninteractive flathub com.pojtinger.felicitas.Multiplex

#discipline and health
flatpak install --assumeyes --noninteractive flathub com.rafaelmardojai.Blanket
#flatpak install --assumeyes --noninteractive flathub dev.Cogitri.Health # Wait for it to be standalone + it would be cool to have vr activity support

#OS tools
flatpak install --assumeyes --noninteractive flathub io.github.giantpinkrobots.flatsweep
flatpak install --assumeyes --noninteractive flathub com.github.tchx84.Flatseal # sandboxing?
flatpak install --assumeyes --noninteractive flathub com.github.GradienceTeam.Gradience # MAKE USE OF CLI TOOL
flatpak install --assumeyes --noninteractive flathub pm.mirko.Atoms # Linux bottles
#flatpak install --assumeyes --noninteractive flathub org.gnome.Firmware # useless
#flatpak install --assumeyes --noninteractive flathub dev.slimevr.SlimeVR # VR
#flatpak install --assumeyes --noninteractive flathub com.dec05eba.gpu_screen_recorder #nvapi u baka
#flatpak install --assumeyes --noninteractive flathub com.feaneron.Boatswain #buy Stream Deck
# flatpak install --assumeyes --noninteractive flathub com.mattjakeman.ExtensionManager # gnome extension manager

#tools
flatpak install --assumeyes --noninteractive flathub app.drey.Warp # file transfer
flatpak install --assumeyes --noninteractive flathub com.belmoussaoui.Decoder
flatpak install --assumeyes --noninteractive flathub com.usebottles.bottles # wine on steroids
flatpak install --assumeyes --noninteractive flathub com.github.ADBeveridge.Raider # File Shredder
flatpak install --assumeyes --noninteractive flathub de.haeckerfelix.Fragments #Torrents
flatpak install --assumeyes --noninteractive flathub net.werwolv.ImHex # hex editor
#flatpak install --assumeyes --noninteractive flathub app.drey.EarTag # not that useful after all
# flatpak install --assumeyes --noninteractive flathub io.github.seadve.Mousai # cool but meh

#work
flatpak install --assumeyes --noninteractive flathub org.nickvision.money #Manage your personal finances
flatpak install --assumeyes --noninteractive flathub ir.imansalmani.IPlan #TODO
flatpak install --assumeyes --noninteractive flathub app.drey.Damask #Wallpaper engine

#school
flatpak install --assumeyes --noninteractive flathub org.gnome.Solanum #pomodoro
flatpak install --assumeyes --noninteractive flathub com.github.flxzt.rnote #Fast paint note
flatpak install --assumeyes --noninteractive flathub app.drey.Dialect #translate
flatpak install --assumeyes --noninteractive flathub com.logseq.Logseq # note app
# flatpak install --assumeyes --noninteractive flathub com.github.fushinari.Wordbook #wait for new gtk (Also dont expect 100%)

#dev tools
flatpak install --assumeyes --noninteractive flathub org.gabmus.whatip
flatpak install --assumeyes --noninteractive flathub com.github.finefindus.eyedropper
flatpak install --assumeyes --noninteractive flathub xyz.tytanium.DoorKnocker
flatpak install --assumeyes --noninteractive flathub org.gnome.design.Contrast
#flatpak install --assumeyes --noninteractive flathub org.gnome.Glade # gtk
#flatpak install --assumeyes --noninteractive flathub-beta com.github.marhkb.Pods #Docker moment #never_again
#flatpak install --assumeyes --noninteractive flathub io.github.achetagames.epic_asset_manager #crash (╯°□°)╯︵ ┻━┻
#flatpak install --assumeyes --noninteractive flathub org.gabmus.gfeeds # 2/10 mid rss reader
#flatpak install --assumeyes --noninteractive flathub org.gnome.Fractal # gtk matrix

#studio tools
flatpak install --assumeyes --noninteractive flathub net.sapples.LiveCaptions
flatpak install --assumeyes --noninteractive flathub com.obsproject.Studio
flatpak install --assumeyes --noninteractive flathub org.gnome.SoundRecorder
flatpak install --assumeyes --noninteractive flathub fr.romainvigier.zap # Soundboard

#games
flatpak install --assumeyes --noninteractive flathub com.tic80.TIC_80
flatpak install --assumeyes --noninteractive flathub sh.ppy.osu
flatpak install --assumeyes --noninteractive flathub org.prismlauncher.PrismLauncher
flatpak install --assumeyes --noninteractive flathub com.github.Anuken.Mindustry
flatpak install --assumeyes --noninteractive flathub install flathub io.github.nokse22.trivia-quiz
flatpak install --assumeyes --noninteractive flathub net.veloren.airshipper
flatpak install --assumeyes --noninteractive flathub net.openra.OpenRA
flatpak install --assumeyes --noninteractive flathub com.zquestclassic.ZQuest
# flatpak install --assumeyes --noninteractive flathub com.heroicgameslauncher.hgl # Gog & epic
#flatpak install --assumeyes --noninteractive flathub org.srb2.SRB2Persona #meme
#flatpak install --assumeyes --noninteractive flathub #maybe steam
#flatpak install --assumeyes --noninteractive flathub io.github.Foldex.AdwSteamGtk #steam GTK UI
# flatpak install --assumeyes --noninteractive launcher.moe com.gitlab.KRypt0n_.an-anime-game-launcher # Genshin

#config
sudo flatpak override com.usebottles.bottles --filesystem=xdg-data/applications
sudo flatpak override com.usebottles.bottles --filesystem=~/.local/share/Steam
