#!/bin/bash
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo

#office tools
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Papers
flatpak install --assumeyes --noninteractive --user flathub org.upscayl.Upscayl            #NO ARM
flatpak install --assumeyes --noninteractive --user flathub io.gitlab.adhami3310.Footage   #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.onlyoffice.desktopeditors  #NO ARM
flatpak install --assumeyes --noninteractive --user flathub org.gnome.gitlab.somas.Apostrophe org.gnome.gitlab.somas.Apostrophe.Plugin.TexLive
flatpak install --assumeyes --noninteractive --user flathub com.github.tenderowl.frog      #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.nokse22.minitext     #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Calculator           #ARM native
flatpak install --assumeyes --noninteractive --user flathub dev.mufeed.Wordbook            #ARM native
# flatpak install --assumeyes --noninteractive --user flathub com.github.alexhuntley.Plots #openglissue

#2d 3d and game dev
flatpak install --assumeyes --noninteractive --user flathub com.prusa3d.PrusaSlicer             #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.kicad.KiCad                     #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.github.libresprite.LibreSprite  #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.gimp.GIMP                       #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.godotengine.Godot               #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.blender.Blender                 #NO ARM

#communication and social media
flatpak install --assumeyes --noninteractive --user flathub dev.geopjr.Tuba        #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.discordapp.Discord #NO ARM
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Fractal      #ARM native

#Travelling
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Maps     #ARM native
flatpak install --assumeyes --noninteractive --user me.sanchezrodriguez.passes #ARM native
flatpak install --assumeyes --noninteractive --user flathub de.schmidhuberj.DieBahn

#security and backup
#flatpak install --assumeyes --noninteractive --user flathub com.belmoussaoui.Authenticator # 2fa
flatpak install --assumeyes --noninteractive --user flathub org.keepassxc.KeePassXC      #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.mpobaschnig.Vaults #ARM native
#flatpak install --assumeyes --noninteractive --user flathub com.hunterwittenborn.Celeste # nextcloud
# flatpak install --assumeyes --noninteractive --user flathub com.gitlab.guillermop.MasterKey # keygen1
# flatpak install --assumeyes --noninteractive --user flathub com.github.alexkdeveloper.forgetpass # keygen2
# flatpak install --assumeyes --noninteractive --user flathub org.gnome.World.PikaBackup #backup 1
#flatpak install --assumeyes --noninteractive --user flathub org.gnome.DejaDup #backup 2
# flatpak install --assumeyes --noninteractive --user flathub app.drey.KeyRack # keys from apps

#entertainment
flatpak install --assumeyes --noninteractive --user flathub com.github.geigi.cozy             #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.bassi.Amberol                  #ARM native
flatpak install --assumeyes --noninteractive --user flathub info.febvre.Komikku               #ARM native
flatpak install --assumeyes --noninteractive --user flathub de.haeckerfelix.Shortwave         #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.pojtinger.felicitas.Multiplex #ARM native
flatpak install --assumeyes --noninteractive --user flathub me.iepure.Ticketbooth             #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.github.johnfactotum.Foliate   #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.thaunknown.miru         #NO ARM

#discipline and health
flatpak install --assumeyes --noninteractive --user flathub com.rafaelmardojai.Blanket #ARM native
#flatpak install --assumeyes --noninteractive --user flathub dev.Cogitri.Health # Wait for it to be standalone + it would be cool to have vr activity support

#OS tools
flatpak install --assumeyes --noninteractive --user flathub com.mattjakeman.ExtensionManager
flatpak install --assumeyes --noninteractive --user flathub com.github.wwmm.easyeffects
flatpak install --assumeyes --noninteractive --user flathub org.gnome.NetworkDisplays
flatpak install --assumeyes --noninteractive --user flathub com.jeffser.Alpaca				    #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.gnome.SimpleScan                            #IDK
flatpak install --assumeyes --noninteractive --user flathub it.mijorus.whisper                              #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.giantpinkrobots.flatsweep             #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.fsobolev.TimeSwitch
flatpak install --assumeyes --noninteractive --user flathub com.github.tchx84.Flatseal                      #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.gnome.baobab
flatpak install --assumeyes --noninteractive --user flathub org.gnome.Loupe
flatpak install --assumeyes --noninteractive --user flathub com.github.GradienceTeam.Gradience              #ARM native
flatpak install --assumeyes --noninteractive --user flathub net.nokyan.Resources                            #ARM native
flatpak install --assumeyes --noninteractive --user flathub pm.mirko.Atoms                                  #ARM native
flatpak install --assumeyes --noninteractive --user flathub it.mijorus.gearlever                            #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.frama.tractor.carburetor                     #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.flattool.Warehouse                    #ARM native
flatpak install --assumeyes --noninteractive --user flathub org.pipewire.Helvum                             #ARM native
flatpak install --assumeyes --noninteractive --user flathub page.codeberg.libre_menu_editor.LibreMenuEditor #ARM native
#flatpak install --assumeyes --noninteractive --user flathub org.gnome.Firmware # useless
#flatpak install --assumeyes --noninteractive --user flathub dev.slimevr.SlimeVR # VR
#flatpak install --assumeyes --noninteractive --user flathub com.dec05eba.gpu_screen_recorder #nvapi u baka
#flatpak install --assumeyes --noninteractive --user flathub com.feaneron.Boatswain #buy Stream Deck
# flatpak install --assumeyes --noninteractive --user flathub com.mattjakeman.ExtensionManager # gnome extension manager

#tools
flatpak install --assumeyes --noninteractive --user flathub org.gnome.clocks org.gnome.Contacts org.gnome.Calendar
flatpak install --assumeyes --noninteractive --user flathub app.drey.Warp                         #ARM native
flatpak install --assumeyes --noninteractive --user flathub page.codeberg.Imaginer.Imaginer       #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.Bavarder.Bavarder           #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.belmoussaoui.Decoder              #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.usebottles.bottles                #NO ARM
flatpak install --assumeyes --noninteractive --user flathub com.github.ADBeveridge.Raider         #ARM native
flatpak install --assumeyes --noninteractive --user flathub de.haeckerfelix.Fragments             #ARM native
flatpak install --assumeyes --noninteractive --user flathub app.drey.Dialect                      #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.gitlab.idevecore.Pomodoro          #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.idevecore.CurrencyConverter #ARM native
flatpak install --assumeyes --noninteractive --user flathub net.werwolv.ImHex                     #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.seadve.Mousai               #ARM native
#flatpak install --assumeyes --noninteractive --user flathub app.drey.EarTag 							#ARM native
# flatpak install --assumeyes --noninteractive --user flathub de.haeckerfelix.AudioSharing #ARM native

#work
flatpak install --assumeyes --noninteractive --user flathub org.nickvision.money #ARM native
flatpak install --assumeyes --noninteractive --user flathub app.drey.Damask      #ARM native
# flatpak install --assumeyes --noninteractive --user flathub ir.imansalmani.IPlan #ARM native

#notes
flatpak install --assumeyes --noninteractive --user flathub com.github.flxzt.rnote #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.logseq.Logseq      #ARM native

#dev tools
flatpak install --assumeyes --noninteractive --user flathub org.gabmus.whatip                #ARM native
flatpak install --assumeyes --noninteractive --user flathub me.iepure.devtoolbox             #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.bytezz.IPLookup        #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.github.finefindus.eyedropper #ARM native
flatpak install --assumeyes --noninteractive --user flathub xyz.tytanium.DoorKnocker         #ARM native
# flatpak install --assumeyes --noninteractive --user flathub org.gnome.design.Contrast
#flatpak install --assumeyes --noninteractive --user flathub org.gnome.Glade # gtk
#flatpak install --assumeyes --noninteractive --user flathub-beta com.github.marhkb.Pods #Docker moment #never_again
#flatpak install --assumeyes --noninteractive --user flathub io.github.achetagames.epic_asset_manager #crash (╯°□°)╯︵ ┻━┻
#flatpak install --assumeyes --noninteractive --user flathub org.gabmus.gfeeds # 2/10 mid rss reader
#flatpak install --assumeyes --noninteractive --user flathub org.gnome.Fractal # gtk matrix

#studio tools
flatpak install --assumeyes --noninteractive --user flathub io.github.seadve.Kooha #ARM native
flatpak install --assumeyes --noninteractive --user flathub net.sapples.LiveCaptions #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.obsproject.Studio    #NO ARM
flatpak install --assumeyes --noninteractive --user flathub org.gnome.SoundRecorder  #ARM native
# flatpak install --assumeyes --noninteractive --user flathub fr.romainvigier.zap      #ARM native

#games
flatpak install --assumeyes --noninteractive --user flathub dev.bragefuglseth.Keypunch
flatpak install --assumeyes --noninteractive --user flathub com.tic80.TIC_80                         #ARM native
flatpak install --assumeyes --noninteractive --user flathub sh.ppy.osu                               #NO ARM
flatpak install --assumeyes --noninteractive --user flathub org.prismlauncher.PrismLauncher          #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.github.Anuken.Mindustry              #ARM native
flatpak install --assumeyes --noninteractive --user flathub io.github.nokse22.trivia-quiz            #ARM native
flatpak install --assumeyes --noninteractive --user flathub net.veloren.airshipper                   #ARM native
flatpak install --assumeyes --noninteractive --user flathub com.pokemmo.PokeMMO                      #ARM native
flatpak install --assumeyes --noninteractive --user launcher.moe moe.launcher.an-anime-game-launcher #NO ARM
#flatpak install --assumeyes --noninteractive --user flathub net.openra.OpenRA
#flatpak install --assumeyes --noninteractive --user flathub com.zquestclassic.ZQuest
# flatpak install --assumeyes --noninteractive --user flathub com.heroicgameslauncher.hgl # Gog & epic
#flatpak install --assumeyes --noninteractive --user flathub org.srb2.SRB2Persona #meme
#flatpak install --assumeyes --noninteractive --user flathub #maybe steam
#flatpak install --assumeyes --noninteractive --user flathub io.github.Foldex.AdwSteamGtk #steam GTK UI

#config
sudo flatpak override com.usebottles.bottles --filesystem=xdg-data/applications
sudo flatpak override com.usebottles.bottles --filesystem=~/.local/share/Steam

#Discord fix
for i in {0..9}; do
	test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i
done
