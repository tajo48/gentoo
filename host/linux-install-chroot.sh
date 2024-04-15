#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
else
	echo "Running as root"
fi

# if pwd is not / then exit with error
if [[ $PWD != "/" ]]; then
	echo "chroot failed, not in /"
	exit 1
else
	echo "Running from /"
fi

#TODO dialout group and dialout add to user
#TODO https://wiki.gentoo.org/wiki/GNU_Emacs#OpenRC
#User

# linux-install-chroot.sh
# Script forked from xar55
# Iproved by: tajo48
# Ver: 1.3.0

# zip
# neovim
# sshfs
# mesa
# dkms
# mpv
# rust-bin
# mtools
# gentoo-sources
# zsh
# linux-headers
programs="
	app-eselect/eselect-repository
	sys-fs/fuse:0
	dev-vcs/git
	app-text/tree
	doas
 	bash
	fastfetch
	grub
	networkmanager
	gentoo-kernel-bin
	linux-firmware
	chrony
	efibootmgr
	ffmpeg
	hdparm
	dosfstools
	sys-apps/gptfdisk
	sys-fs/genfstab
	cryfs
	app-portage/mirrorselect
	ripgrep
	emacs
 	ufw
"
#chrony for time sync

ip=$1
minimal=$2
gnome=$3
wm=$4
vm=$5
usersh=$6
# Base & Firmware (Gentoo)
source "/etc/profile"
emerge-webrsync
sleep 2s
eselect profile list
sleep 2s

# TODO 3 for hardened
if [[ $minimal == 1 ]]; then
	echo "selected profile 1"
	eselect profile set 1
elif [[ $gnome == 1 ]]; then
	echo "selected profile 6"
	eselect profile set 6
else
	echo "selected profile 5"
	eselect profile set 5
fi
eselect profile list

# Package.use
echo -en "app-admin/doas persist" >/etc/portage/package.use/doas

# Language and TimeZone
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
emerge --config sys-libs/timezone-data
echo -e "en_US.UTF-8 UTF-8" >>/etc/locale.gen
locale-gen
eselect locale set en_US.utf8
source /etc/profile #BC eselect said so

# Gentoo
emerge --quiet-build --update --deep --newuse --backtrack=99 --complete-graph @world
#fix circular dependency
USE="minimal" emerge --oneshot --quiet-build libsndfile
emerge --newuse --quiet-build media-libs/libsndfile

emerge --autounmask=y --quiet-build --autounmask-continue=y $programs
git -v || exit 1
emerge --depclean --quiet-build

if [[ $gnome == 1 ]]; then

	curl ${ip}:7878/gnome >/etc/portage/package.use/gnome

	#fix build fuckup
	emerge --quiet-build perl app-doc/doxygen

	#fix perl common sense and doxygen in llvm build
	emerge --quiet-build --autounmask=y --autounmask-unrestricted-atoms=y --autounmask-continue=y --autounmask-backtrack=y --backtrack=1000 --autounmask-use=y gnome-base/gnome-light gnome-software flatpak
	gnome-shell --version || exit 1
	rc-update add elogind boot
	emerge --quiet-build --noreplace gui-libs/display-manager-init
	echo "DISPLAYMANAGER=\"gdm\"" >>/etc/conf.d/display-manager
	rc-update add display-manager default
fi

# Turn on services
rc-update add NetworkManager
rc-update add ufw default
# rc-update add iptables default
# rc-update add ip6tables default

sed -i '/GRUB_TIMEOUT/s/^#//g;s/5/1/;/GRUB_CMDLINE_LINUX_DEFAULT/s/quiet//' /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot/EFI
# echo 'GRUB_DISABLE_OS_PROBER=false' >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

#User settings
# add dialout
useradd -m -g users -G wheel,audio,video amnesia
sed -i '/enforce/s/everyone/users/' /etc/security/passwdqc.conf
echo -en "kek\nkek" | passwd amnesia
echo -en "kek\nkek" | passwd root
echo "amnesia" >>/etc/hostname
curl -s "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts" >>/etc/hosts
echo "0.0.0.0 www.youtube.com" >>/etc/hosts
# sed -i '/PermitRootLogin p/s/^#//;s/prohibit-password/yes/' /etc/ssh/sshd_config

#doas
ln -s $(which doas) /usr/bin/sudo

echo "permit persist :wheel" >/etc/doas.conf
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf
#if user is equal to 1 and minimal is equal to 0
if [[ $usersh == 1 ]]; then
	while true; do
		if ping -c 1 startpage.com &>/dev/null; then
			echo "Internet connection detected."
			break
		else
			echo "No internet connection. Retrying in 5 seconds..."
			sleep 5
		fi
	done

	curl -s "${ip}:7878/user.sh" >/root/user.sh
	sh /root/user.sh $ip $minimal $gnome $wm $vm
fi

#TODO fix max user files fs.file-max
#$(ulimit -n)*$(ulimit -u)
# sysctl -w fs.file-max=100000

#TODO vm.max_map_count

chown -hR amnesia:users /home/amnesia
fastfetch
# Configurating
# chsh -s /bin/zsh $user
# cp -r . ~
# add  cp ~/Desktop/Projekty/gentoo/host/community.lua ~/.config/nvim/lua/plugins/community.lua
# End
