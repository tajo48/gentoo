#!/bin/bash
cd ~/

ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit

if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    echo "ssh key exists"
    touch ~/.ssh/known_hosts
    ssh-keygen -F github.com || ssh-keyscan github.com > ~/.ssh/known_hosts
    
    sudo rm -r ~/ARCH ~/Git/ARCH
    cd ~/Git
    git clone git@github.com:tajo48/ARCH.git
    cp -r ~/Git/ARCH ~/
    rm -rf ~/ARCH/.git
    
    rm -rf ~/.xinitrc
    cp ~/ARCH/files/xinitrc ~/.xinitrc
    
    rm -rf  ~/.zshrc ~/.config/coc
    cp ~/ARCH/files/zshrc ~/.zshrc
else
    echo "ssh key not found"
    exit 1
fi




# rm -rf ~/.config/nvim
# mkdir ~/.config/nvim
# cp ~/ARCH/files/init.vim ~/.config/nvim
