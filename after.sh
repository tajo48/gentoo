#! /bin/bash
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Syy

#programs
pacman -S --noconfirm alsa-utils netctl mtools dialog wpa_supplicant dhcpcd git neofetch mc xclip clipmenu rtorrent openssh tmux arandr slock
pacman -S --noconfirm obs-studio blender bashtop calc virtualbox virtualbox-host-modules-arch vlc youtube-dl htop tar p7zip xcompmgr audacity gimp cmus discord nautilus
pacman -S --noconfirm make alsa-firmware wget xorg xorg-server xorg-xinit curl libxft fakeroot binutils patch pkgconf base-devel python-pywal alsa
pacman -S --noconfirm firefox zsh feh virtualbox-guest-utils python-pynvim nodejs yarn torbrowser-launcher
pacman -S --noconfirm xf86-video-vesa xf86-video-ati xf86-video-intel xf86-video-amdgpu xf86-video-nouveau xf86-video-fbdev
pacman -S --noconfirm grub ttf-joypixels ttf-inconsolata
pacman -S --noconfirm pulseaudio linux-headers dkms


#remake dwm 
#rm xcompmgr 
#vim config
#torrents pamac pulseaudio xone SOUNDUX vifm




# Set date time
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc

# Set locale to en_US.UTF-8 UTF-8
echo "en_US.UTF-8 UTF-8
pl_PL.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

# Set hostname
echo "ARCH" >> /etc/hostname
echo "
127.0.0.1	localhost
::1		localhost
127.0.1.1	ARCH" >> /etc/hosts

# Set root passwd
echo -en "root\nroot" | passwd

# Useradd,internet and sudo and deepin setup
systemctl enable dhcpcd
useradd -m tajo48
echo -en "root\nroot" | passwd tajo48
usermod -aG wheel,audio,video,optical,storage,users tajo48
sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers
#sed -i '/#start-default-seat=true/a greeter-session=lightdm-deepin-greeter' /etc/lightdm/lightdm.conf
sed -i '/Port/s/^#//g' /etc/ssh/sshd_config
sed -i '/Port/ s/22/2137/' /etc/ssh/sshd_config
systemctl enable sshd

grub-install --target=i386-pc ${1} 
grub-mkconfig -o /boot/grub/grub.cfg




#makepkg in root
rm /usr/bin/makepkg
curl -k -o /usr/bin/makepkg https://raw.githubusercontent.com/tajo48/ARCH/master/files/makepkg
chmod +x /usr/bin/makepkg

cd /home/tajo48
git clone https://github.com/tajo48/ARCH.git
su tajo48 << 'NO'
wal -i /home/tajo48/ARCH/photos
sh -c "$(curl -k -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
NO


# curl -k -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# sh -c 'curl -k -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


#dwm
cd /home/tajo48
cp /home/tajo48/ARCH/files/zshrc /home/tajo48/.zshrc
cp /home/tajo48/ARCH/files/xinitrc /home/tajo48/.xinitrc
chsh -s /bin/zsh tajo48
mkdir /home/tajo48/Downloads /home/tajo48/Desktop

#nvim
# mkdir /home/tajo48/.config/nvim
# cp /home/tajo48/ARCH/files/init.vim /home/tajo48/.config/nvim/init.vim


#yay 
cd /home/tajo48/ARCH/builds/
git clone https://aur.archlinux.org/yay-git.git
cd /home/tajo48/ARCH/builds/yay-git
makepkg -s -i -c --noconfirm



chown tajo48 -R /home/tajo48/

