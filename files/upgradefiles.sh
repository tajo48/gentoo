#!/bin/bash
cd /home/tajo48/
mkdir -p /home/tajo48/ /home/tajo48/ARCH/
touch /home/tajo48/.xinitrc /home/tajo48/.zshrc
sudo rm -r /home/tajo48/ARCH

ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit
rm -rf /home/tajo48/ARCH
if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    echo "ssh key exists"
    touch /home/tajo48/.ssh/known_hosts
    ssh-keygen -F github.com || ssh-keyscan github.com > /home/tajo48/.ssh/known_hosts
    git clone git@github.com:tajo48/ARCH.git
else
    echo "ssh key not found"
    git clone https://github.com/tajo48/ARCH.git
fi

rm -rf /home/tajo48/.xinitrc /home/tajo48/.zshrc
cp /home/tajo48/ARCH/files/xinitrc /home/tajo48/.xinitrc
cp /home/tajo48/ARCH/files/zshrc /home/tajo48/.zshrc

if [ -f "/home/tajo48/Git/ARCH" ]; then
    cd /home/tajo48/Git/ARCH
    
    # if git diff | w is not empty, then exit
    if git diff --quiet; then
        echo "no changes"
        sudo rm -r /home/tajo48/Git/ARCH
        cp -r /home/tajo48/ARCH /home/tajo48/Git/ARCHc
    else
        echo "changes found"
    fi
else
    cd /home/tajo48/Git
    if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
        echo "ssh key exists"
        git clone git@github.com:tajo48/ARCH.git
    else
        echo "ssh key not found"
        git clone https://github.com/tajo48/ARCH.git
    fi
    
fi

rm -rf /home/tajo48/ARCH/.git
