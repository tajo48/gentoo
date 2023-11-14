#!/bin/bash

ip=$1

##sync time
chronyd -q
##sync time

#USER
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gui-wm/hyprland
read -p "hyprland"
#END USER

#TODO
#Waypipe

#################
#SANDBOX OVERLAY []
eselect repository create sandbox
/var/db/repos/sandbox/test.ebuild

#SANDBOX OVERLAY END
#################

#################
#GURU OVERLAY
eselect repository enable guru
read -p "enable guru"
emaint sync -r guru
read -p "sync guru"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y =gui-apps/eww-9999
read -p "eww-9999"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gui-libs/xdg-desktop-portal-hyprland
read -p "xdg-desktop-portal-hyprland"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gui-apps/hyprland-plugins
read -p "hyprland-plugins"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gui-apps/hyprpaper
read -p "hyprpaper"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gui-apps/hyprpicker
read -p "hyprpicker"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gui-wm/hyprland-contrib
read -p "hyprland-contrib"
#GURU OVERLAY END
#################

#################
#COVA OVERLAY
eselect repository enable cova
read -p "enable cova"
emaint sync -r cova
read -p "sync cova"
emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y media-fonts/nerd-fonts
#COVA OVERLAY END
#################

##FIGURE THIS OUT
echo "vm.maxmapcount=2147483642" >>/etc/sysctl.d/90-override.conf

# emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y x11-wm/i3 x11-base/xorg-server x11-terms/alacritty

# --newuse
# --noreplace
# --dynamic-deps

# emerge --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y x11-libs/libnotify media-libs/alsa-lib media-sound/pulseaudio
# read -p "fucking debug"
#################
#EDGETS OVERLAY [www-client/min,]
# eselect repository enable edgets
# emaint sync -r edgets
# emerge  --verbose --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y www-client/min
#EDGETS OVERLAY END
#################

#################
# emerge --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y gui-wm/hyprland
#################
rm /root/user.sh
