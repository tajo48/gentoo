#!/bin/bash
cd /home/tajo48/
sudo rm -r /home/tajo48/ARCH

ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit

if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    echo "ssh key exists"
    touch /home/tajo48/.ssh/known_hosts
    ssh-keygen -F github.com || ssh-keyscan github.com > /home/tajo48/.ssh/known_hosts
    git clone git clone git@github.com:tajo48/ARCH.git
else
    echo "ssh key not found"
    git clone https://github.com/tajo48/ARCH.git
fi


rm -rf /home/tajo48/ARCH/.git

rm -rf /home/tajo48/.xinitrc
cp /home/tajo48/ARCH/files/xinitrc /home/tajo48/.xinitrc

rm -rf  /home/tajo48/.zshrc /home/tajo48/.config/coc
cp /home/tajo48/ARCH/files/zshrc /home/tajo48/.zshrc

# if git diff | w is not empty, then exit
if git diff --quiet; then
    echo "no changes"
    sudo rm -r /home/tajo48/Git/ARCH
    cp -r /home/tajo48/ARCH /home/tajo48/Git/ARCH
    rm -rf /home/tajo48/ARCH/.git
else
    echo "changes found"
fi



