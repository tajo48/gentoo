#! /bin/bash
ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit

if [ -z $1 ]; then
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
else
    disk=$1
fi
usbdrive="..."
echo "disk: $disk"

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
else
    #this is hard drive
    echo "install arch on hard drive"
fi
sleep 3s

#wipe for this to work you need to have a drive that supports uasp and trim
blkdiscard -f ${disk}

#partition
sgdisk -Z -o -n 1:0:+10M -t 1:EF02 -n 2:0:+500M -t 2:EF00 -n 3:0:0 -t 3:8300 ${disk}

if [[ ${disk} == "/dev/"nvme* ]]
then
    echo "nvme"
    #format
    mkfs.fat -F32 ${disk}p2
    mkfs.ext4 ${disk}p3
    
    #mount
    mkdir -p /mnt
    mount ${disk}p3 /mnt
    mkdir /mnt/boot
    mount ${disk}p2 /mnt/boot
else
    echo "sd"
    #format
    mkfs.fat -F32 ${disk}2
    mkfs.ext4 ${disk}3
    
    #mount
    mkdir -p /mnt
    mount ${disk}3 /mnt
    mkdir /mnt/boot
    mount ${disk}2 /mnt/boot
fi

#set up time
timedatectl set-ntp true

#initate pacman keyring
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys

#pacstrap
pacstrap /mnt base linux pacman sudo linux-firmware dosfstools wget

#fstab
genfstab -U /mnt > /mnt/etc/fstab


#copy post-install system cinfiguration script to new /root
curl -k --create-dirs -o /mnt/root/after.sh https://raw.githubusercontent.com/tajo48/ARCH/master/after.sh
chmod +x /mnt/root/after.sh

#chroot into new system
arch-chroot /mnt /root/after.sh ${disk}
