#!/bin/bash

#curl localhost:7878 > install.sh && sh install.sh

if ! command -v efibootmgr &>/dev/null; then
	echo "Error: efibootmgr is not installed. Please install it to run this script."
	exit 1
fi

# Check if the system is booted in UEFI mode
if efibootmgr -v &>/dev/null; then
	echo "System is booted in UEFI mode."
else
	echo "System is not booted in UEFI mode. Exiting..."
	exit 1
fi

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
else
	echo "Running as root"
fi

#defaults
minimal=0
gnome=1
wm=0
usersh=0

disk="sda"
ip="localhost"

if [[ $(dmesg | grep -i "hypervisor detected") ]]; then
	vm=1
else
	vm=0
fi

for arg in "$@"; do
	case $arg in
	-h | --help)
		echo "Options:"
		echo "  -h, --help          Show this help message"
		echo "  -i, --ip            Define IP"
		echo "  -m, --minimal       Turns off all options except base system"
		echo "  -g, --gnome         Enable Gnome"
		echo "  -k, --kde           Enable KDE"
		echo "  -w, --wm            Enable Window manager (hyrpland)"
		echo "  -u, --unattended    Enable unattended mode"
		echo "  -a, --attended      Disable uattended mode"
		echo "  -s, --usersh        Disable user.sh"
		exit 0
		;;
	-i | --ip)
		read -p "IP: " ip
		#TODO handle it better
		;;
	-m | --minimal)
		minimal=1
		;;
	-g | --gnome)
		gnome=1
	-k | --kde)
	    kde=0
		;;
	-w | --wm)
		wm=1
		;;
	-u | --unattended)
		vm=1
		;;
	-a | --attended)
		vm=0
		;;
	-s | --usersh)
		usersh=0
		;;
	*)
		# Handle other arguments or display an error
		echo "Error: Unknown option or argument '$arg'"
		exit 1
		;;
	esac
	shift # Consume the processed argument
done

#chronyd checkup
chronyd=0
if command -v chronyd &>/dev/null; then
	chronyd=1
	chronyd -q
fi
stage3=$(curl -s https://www.gentoo.org/downloads/ | grep -oP '(?<=<a href=")https://distfiles.gentoo.org/releases/amd64/autobuilds/[^-]+/stage3-amd64-openrc-[^-]+.tar.xz(?=" data-relurl)' | head -n 1)
clear

#Portage set to 1 + handle for minimal != gnome | hyrpland
#gnome = change portage to gnome
#

if [[ $minimal == 1 ]]; then
	gnome=0
	kde=0
	wm=0
	usersh=0
fi

if [ $vm == 0 ]; then
	selectdisk() {
		items=$(lsblk -d -p -n -l -o NAME,SIZE -e 7,11)
		options=()
		IFS_ORIG=$IFS
		IFS=$'\n'
		for item in ${items}; do
			options+=("${item}" "")
		done
		IFS=$IFS_ORIG
		result=$(whiptail --backtitle "${APPTITLE}" --title "${1}" --menu "" 0 0 0 "${options[@]}" 3>&1 1>&2 2>&3)
		if [ "$?" != "0" ]; then
			return 1
		fi
		return 0

	}
	selectdisk "Select disk"
	if [ -z "$result" ]; then
		echo "Drive is not set"
		exit 1
	fi
	disk=${result%%\ *}
	disk=${disk##*/}
fi
if hdparm -I /dev/$disk | grep -qi "Data Set Management TRIM supported"; then
	trim=1
else
	trim=0
fi

RAM=$(cat /proc/meminfo | grep MemTotal: | sed 's/[a-zA-Z: ]//g')
RAM=$(expr $RAM / 1024)
value1=$(nproc)
value2=$(($RAM / 2000))
if [ "$value1" -lt "$value2" ]; then
	makeopts=$value1
else
	makeopts=$value2
fi

# Swap calc TODO (enchance it)
RAM=$(free -m | awk '/^Mem:/{print $2}')
r=1
SWAP=$(echo "$RAM * $r" | bc)

# echo "Ram:$RAM Swap:$SWAP"
# read -p "Press enter to continue"

echo "Your setting are:"
echo "Drive:            $disk "
echo "Trim:             $(if [ "$trim" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo "IP and port:      $ip:7878 and curl check: $(curl -s $ip:7878/makeitrain404)"
echo "chronyd:          $(if [ "$chronyd" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo "Virtual machine:  $(if [ "$vm" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo ""
echo "Minimal:          $(if [ "$minimal" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo "Gnome:            $(if [ "$gnome" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo "KDE:            $(if [ "$kde" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo "Window manager:   $(if [ "$wm" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo "User.sh:          $(if [ "$usersh" -eq 1 ]; then echo "true"; else echo "false"; fi)"
echo ""
echo "Makeopts:         $makeopts"
echo "Swap:             $(($SWAP))MB"
echo "RAM:              $(($RAM))MB"
echo "Nproc:            $(nproc)"
echo "stage3:           $stage3"

read -p "Press enter to continue"

read -rep $'fr?\n' fr
if [[ $fr != "fr" ]]; then
	echo "K"
	exit 0
fi

echo "NICE"
sleep 3s

# Settings
distroName="amnesia"
blkdiscard -f /dev/${disk}
wipefs -a /dev/${disk}
sgdisk -Zo -n 2:0:+512M -t 2:EF00 -n 1:0:0 -t 1:8300 /dev/${disk}
mkfs.ext4 -F /dev/${disk}1
mkfs.fat -F 32 /dev/${disk}2
fatlabel /dev/${disk}2 BOOT #NO OUTPUT
mkdir -p /mnt/${distroName}
mount /dev/${disk}1 /mnt/${distroName}
mkdir -p /mnt/${distroName}/boot/EFI
mount /dev/${disk}2 /mnt/${distroName}/boot/EFI

#Swap
fallocate -l ${SWAP}MB /mnt/${distroName}/swapfile
chmod 0600 /mnt/${distroName}/swapfile
mkswap /mnt/${distroName}/swapfile
swapon /mnt/${distroName}/swapfile

cd /mnt/${distroName} || exit 1
wget $stage3
stage3=$(echo ${stage3} | awk -F/ '{print $NF}')
tar xpvf /mnt/${distroName}/${stage3} --xattrs-include='*.*' --numeric-owner
rm /mnt/${distroName}/${stage3}

#Make.conf
curl ${ip}:7878/make.conf >/mnt/${distroName}/etc/portage/make.conf
curl ${ip}:7878/gnome >/mnt/${distroName}/etc/portage/package.use/gnome
echo -e "\nMAKEOPTS=\"-j$makeopts\"" >>/mnt/${distroName}/etc/portage/make.conf
mirrorselect -s10 -o >>/mnt/${distroName}/etc/portage/make.conf
cat /mnt/${distroName}/etc/portage/make.conf

# if /mnt/${distroName}/etc/portage/make.conf dont contain "GENTOO_MIRRORS" exit 1
if ! grep "GENTOO_MIRRORS" /mnt/${distroName}/etc/portage/make.conf; then
	echo "GENTOO_MIRRORS not found in /mnt/${distroName}/etc/portage/make.conf"
	exit 1
fi
#Repos.conf
mkdir -p /mnt/${distroName}/etc/portage/repos.conf
cp /mnt/${distroName}/usr/share/portage/config/repos.conf /mnt/${distroName}/etc/portage/repos.conf/gentoo.conf
mkdir -p /mnt/${distroName}/etc/portage/package.accept_keywords
echo "dev-lang/rust ~amd64" >> /mnt/${distroName}/etc/portage/package.accept_keywords/rust
#zzz_autounmask
for d in /mnt/${distroName}/etc/portage/package.*; do touch $d/zz_autounmask; done

#DNS
cp --dereference /etc/resolv.conf /mnt/${distroName}/etc/

#Mount
mount -t proc /proc /mnt/${distroName}/proc
mount -R /sys /mnt/${distroName}/sys
mount -R /dev /mnt/${distroName}/dev
mount -B /run /mnt/${distroName}/run
mount --make-rslave /mnt/${distroName}/sys
mount --make-rslave /mnt/${distroName}/dev
mount --make-slave /mnt/${distroName}/run
genfstab -U /mnt/${distroName} >/mnt/${distroName}/etc/fstab
test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm /run/shm #this wont work on official iso
curl -so /mnt/${distroName}/root/linux-install-chroot.sh ${ip}:7878/linux-install-chroot.sh
chmod +x /mnt/${distroName}/root/linux-install-chroot.sh

chroot_command="/mnt/${distroName}/ /root/linux-install-chroot.sh $ip $minimal $gnome $kde $wm $vm $usersh"
chroot ${chroot_command}
