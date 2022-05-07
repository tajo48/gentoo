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

if (whiptail --title "Confirm" --yesno "Are you sure you want to HARD format $disk?" 8 78) then
    echo "You chose to HARD format $disk"
    if (whiptail --title "Turn off when completed" --yesno "Do you want to turn off the computer when the installation is completed $disk?" 8 78) then
        sleep 6s
        sudo sh /home/tajo48/ARCH/files/format.sh $disk
        sudo sh /home/tajo48/ARCH/install.sh $disk
        sudo shutdown now
    else
        sleep 6s
        sudo sh /home/tajo48/ARCH/files/format.sh $disk
        sudo sh /home/tajo48/ARCH/install.sh $disk
    fi
else
    echo "You chose to not format $disk"
    if (whiptail --title "Turn off when completed" --yesno "Do you want to turn off the computer when the installation is completed $disk?" 8 78) then
        sleep 6s
        sudo sh /home/tajo48/ARCH/install.sh $disk
        sudo shutdown now
    else
        sleep 6s
        sudo sh /home/tajo48/ARCH/install.sh $disk
    fi
fi





