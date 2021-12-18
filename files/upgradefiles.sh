#!/bin/bash


ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit

sudo rm -r ~/ARCH
git clone https://github.com/tajo48/ARCH.git | dmenu

rm -rf ~/.xinitrc
cp ~/ARCH/files/xinitrc ~/.xinitrc

rm -rf  ~/.zshrc ~/.config/coc
cp ~/ARCH/files/zshrc ~/.zshrc

# rm -rf ~/.config/nvim
# mkdir ~/.config/nvim
# cp ~/ARCH/files/init.vim ~/.config/nvim



