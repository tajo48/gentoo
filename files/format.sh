#! /bin/bash

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

echo "disk: $disk"
echo "Formatting disk..."
sleep 6s
sudo dd if=/dev/zero of=${disk} status=progress bs=1M count=1
