#! /bin/bash

#programs variable
programs="pulseaudio linux-headers dkms iwd ranger lm_sensors npm mpv qbittorrent ttf-joypixels ttf-jetbrains-mono ttf-liberation grub efibootmgr xf86-video-vesa xf86-video-ati xf86-video-intel xf86-video-amdgpu xf86-video-nouveau xf86-video-fbdev firefox zsh feh virtualbox-guest-utils python-pynvim nodejs yarn torbrowser-launcher alsa-utils netctl mtools dialog wpa_supplicant dhcpcd git neofetch mc xclip clipmenu rtorrent openssh tmux arandr obs-studio blender bashtop calc virtualbox virtualbox-host-modules-arch vlc youtube-dl htop tar p7zip xcompmgr audacity gimp cmus discord nautilus slock make alsa-firmware wget xorg xorg-server xorg-xinit curl libxft fakeroot binutils patch pkgconf base-devel python-pywal alsa"

#remake dwm st dmenu
#remove xcompmgr
#networkmanager wifi gui and systemd enable
#ranger config
#pulseaudio gui
#check if git clone wihtout fingerprint works
#check internet connection on install.sh start
#pamac gui???
#xone and soundux
#torrent client
#portable arch and arch install media
#better zsh config
#better nvim config
#split updatefiles.sh to updatefiles.sh and setup.sh
#ue5 works on dwm?
#wacom script
#wifi dmenu
#sudo pacman -S pavucontrol
#Xclip notflix
#Notflix download or stream
#Cut WiFi menu
#Make arch usb
#Delete dmenu notify
#Delete all terminal pref script from ctrl+win+p
#ssh loockup (saftey measure)



#enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

#update list of packages
pacman -Syy

#pacman install from programs variable
pacman -S --noconfirm $programs

#set date time
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
hwclock --systohc

#set locale to en_US.UTF-8 UTF-8
echo -e "en_US.UTF-8 UTF-8\npl_PL.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

#enable networkd and resolved
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl enable iwd.service

#network
ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
echo -e "[Match]\nName=en*\nName=eth*\n\n[Network]\nDHCP=yes\nIPv6PrivacyExtensions=yes\n\n[DHCPv4]\nRouteMetric=100\n\n[IPv6AcceptRA]\nRouteMetric=100" >> /etc/systemd/network/20-ethernet.network
echo -e "[Match]\nName=wl*\n\n[Network]\nDHCP=yes\nIPv6PrivacyExtensions=yes\n\n[DHCPv4]\nRouteMetric=600\n\n[IPv6AcceptRA]\nRouteMetric=600\n" >> /etc/systemd/network/20-wlan.network

#timesync
systemctl enable systemd-timesyncd.service

#set hostname
echo "ARCH" >> /etc/hostname

#set localhost
echo -e"\n127.0.0.1	localhost\n::1		localhost\n127.0.1.1	ARCH\n" >> /etc/hosts

#set root passwd
echo -en "root\nroot" | passwd

#internet deamon
####################systemctl enable dhcpcd

#add user
useradd -m tajo48

#set user passwd
echo -en "root\nroot" | passwd tajo48

#set user groups
usermod -aG wheel,audio,video,optical,storage,users tajo48

#set sudo password to no require
sed -i '/%wheel ALL=(ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers

#set ssh and ssh-deamon
sed -i '/Port/s/^#//g' /etc/ssh/sshd_config
sed -i '/Port/ s/22/2137/' /etc/ssh/sshd_config
systemctl enable sshd

#journal setup
mkdir -p /etc/systemd/journald.conf.d
echo -e "[Journal]\nStorage=volatile\nSystemMaxUse=16M\nRuntimeMaxUse=32M\n" > /etc/systemd/journald.conf.d/10-volatile.conf

#sed change realtime to noatime and atime in etc/fstab
sudo sed -i 's/realtime/noatime/g' /etc/fstab
sudo sed -i 's/atime/noatime/g' /etc/fstab

#install grub and make config
if  [${2} = "usb" ]
then
    grub-install --target=i386-pc --boot-directory /boot --removable ${1}
    grub-install --target=x86_64-efi --efi-directory /boot --boot-directory /boot --removable
else 
    grub-install --target=i386-pc ${1} 
fi
grub-mkconfig -o /boot/grub/grub.cfg


#makepkg in root
rm /usr/bin/makepkg
curl -k -o /usr/bin/makepkg https://raw.githubusercontent.com/tajo48/ARCH/master/files/makepkg
chmod +x /usr/bin/makepkg

#install my config repo
cd /home/tajo48
git clone https://github.com/tajo48/ARCH.git

#wal for dwm,st and dmenu with zsh install
su tajo48 << 'NO'
wal -i /home/tajo48/ARCH/photos
sh -c "$(curl -k -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
NO

# curl -k -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# sh -c 'curl -k -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#dotfiles
cp /home/tajo48/ARCH/files/zshrc /home/tajo48/.zshrc
cp /home/tajo48/ARCH/files/xinitrc /home/tajo48/.xinitrc

#set zsh as default shell
chsh -s /bin/zsh tajo48

#mkdir and touch
mkdir /home/tajo48/Downloads /home/tajo48/Desktop /home/tajo48/Pictures /home/tajo48/Git /home/tajo48/Videos /home/tajo48/Wallpapers
touch /home/tajo48/weather

#nvim
# mkdir /home/tajo48/.config/nvim
# cp /home/tajo48/ARCH/files/init.vim /home/tajo48/.config/nvim/init.vim

#install yay
cd /home/tajo48/Git/
git clone https://aur.archlinux.org/yay-git.git
cd /home/tajo48/Git/yay-git
makepkg -s -i -c --noconfirm

#install webtorrent
cd /home/tajo48/Git/
git clone https://aur.archlinux.org/webtorrent-cli.git
cd /home/tajo48/Git/webtorrent-cli
makepkg -sri --noconfirm

#chown
chown tajo48 -R /home/tajo48/
