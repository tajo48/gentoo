#! /bin/bash
selectdisk(){
    items=$(lsblk -d -p -n -l -o NAME,SIZE -e 7,11)
    options=()
    IFS_ORIG=$IFS
    IFS=$'\n'
    for item in ${items}
    do
        options+=("${item}" "")
    done
    IFS=$IFS_ORIG
    result=$(whiptail --backtitle "${APPTITLE}" --title "${1}" --menu "" 0 0 0 "${options[@]}" 3>&1 1>&2 2>&3)
    if [ "$?" != "0" ]
    then
        return 1
    fi
    return 0
}

selectdisk
disk=${result%%\ *}
usbdrive="..."

for device in /sys/block/*
do
    if udevadm info --query=property --path=$device | grep -q ^ID_BUS=usb
    then
        usb=$(echo $device | sed -n 's/^.*\/block\/\(.*\)/\1/p')
        
        if [ ${disk} = "/dev/${usb}" ]
        then
            #this is usb drive
            usbdrive=${disk}
        fi
        
    fi
done

if [ ${usbdrive} = ${disk} ]
then
    #this is usb drive
    echo "install arch on usb drive"
	sleep 3s
    #wipe
    blkdiscard -f ${disk}
    
    #partition
    sgdisk -o -n 1:0:+10M -t 1:EF02 -n 2:0:+500M -t 2:EF00 -n 3:0:0 -t 3:8300 ${disk}
    
    #format
    mkfs.fat -F32 ${disk}2
    mkfs.ext4 ${disk}3
    
    #mount
    mkdir -p /mnt/usb
    mount ${disk}3 /mnt/usb
    mkdir /mnt/usb/boot
    mount ${disk}2 /mnt/usb/boot

	#set up time
    timedatectl set-ntp true
    
    #initate pacman keyring
    #pacman-key --init
    #pacman-key --populate archlinux
    #pacman-key --refresh-keys
    
    #pacstrap
    pacstrap /mnt/usb base linux pacman sudo linux-firmware dosfstools wget
    
    #fstab
    genfstab -U /mnt/usb > /mnt/usb/etc/fstab
    
    #generate fstab
    genfstab -U /mnt >> /mnt/etc/fstab
    
    #copy post-install system cinfiguration script to new /root
    curl -k --create-dirs -o /mnt/root/after.sh https://raw.githubusercontent.com/tajo48/ARCH/master/after.sh
    chmod +x /mnt/root/after.sh
    
    #chroot into new system
    arch-chroot /mnt /root/after.sh ${disk} usb
else
	#this is hard drive
	echo "install arch on hard drive"
	sleep 3s

	#wipe
    blkdiscard -f ${disk}

    #partition
    parted ${disk} --script mklabel msdos
    parted ${disk} --script mkpart primary linux-swap 1MiB 300MiB #boot /dev/sda1
    parted ${disk} --script mkpart primary ext4 300MiB 100% #root /dev/sda2
    parted ${disk} --script set 2 boot on
    
    #wipefs
    wipefs ${disk}1
    wipefs ${disk}2
    
    #mkfs
    mkfs.ext4 ${disk}2
    mkswap ${disk}1
    
    #mount the partitions
    mount ${disk}2 /mnt
    mkdir /mnt/boot
    swapon ${disk}1
    
    #set up time
    timedatectl set-ntp true
	    
    #initate pacman keyring
    #pacman-key --init
    #pacman-key --populate archlinux
    #pacman-key --refresh-keys
    
    #pacstrap
    pacstrap /mnt base linux pacman sudo linux-firmware dosfstools wget
    
    #fstab
    genfstab -U /mnt >> /mnt/etc/fstab
    
    #copy post-install system cinfiguration script to new /root
    curl -k --create-dirs -o /mnt/root/after.sh https://raw.githubusercontent.com/tajo48/ARCH/master/after.sh
    chmod +x /mnt/root/after.sh
    
    #chroot into new system
    arch-chroot /mnt /root/after.sh ${disk} hard
fi