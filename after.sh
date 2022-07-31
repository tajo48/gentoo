#! /bin/bash

#programs variable
programs="perl-image-exiftool bluez-utils sysprof fwupd gnome-bluetooth-3.0 gocryptfs cryfs python-pip exfat-utils gvim neovim steam-native-runtime steam jq pacman-contrib flatpak xf86-input-wacom gnome ncdu gnome-keyring libsecret libgnome-keyring networkmanager lib32-nvidia-utils pulseaudio pulseaudio-alsa fzf dunst streamlink nvidia-settings pavucontrol nvidia libnewt arch-install-scripts linux-headers dkms iwd ranger lm_sensors npm mpv qbittorrent ttf-joypixels ttf-jetbrains-mono ttf-liberation grub efibootmgr xf86-video-vesa xf86-video-ati xf86-video-intel xf86-video-fbdev firefox zsh feh virtualbox-guest-utils python-pynvim nodejs yarn torbrowser-launcher alsa-utils netctl mtools dialog wpa_supplicant dhcpcd git neofetch mc xclip clipmenu rtorrent openssh tmux arandr btop calc virtualbox virtualbox-host-modules-arch vlc htop tar p7zip xcompmgr audacity cmus nautilus slock make alsa-firmware wget xorg xorg-server xorg-xinit curl libxft fakeroot binutils patch pkgconf base-devel python-pywal alsa"

#script that downloads and installs programs from /git
#update makepkg
#remake dwm st dmenu
#remove xcompmgr
#ranger config
#xone and soundux
#better zsh config
#better nvim config
#split updatefiles.sh to updatefiles.sh and setup.sh
#drivers check
#delete dwm
#apply sway

#FINALLY
#https://github.com/avanishsubbiah/adwaita-materialu
#https://github.com/ArtyIF/AdwCustomizer
#(wait to AdwCustomizer flathub release)


#initate pacman keyring
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys


#enable multilib
sed -i "/Color/"'s/^#//' /etc/pacman.conf
sed -i "/VerbosePkgLists/"'s/^#//' /etc/pacman.conf
sed -i "/#ParallelDownloads = 5/"'s/^#//' /etc/pacman.conf
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf



#update list of packages
pacman -Syy --noconfirm

#pacman install from programs variable
pacman -S --noconfirm $programs
pacman -R --noconfirm amdvlk


usbdrive="..."
for device in /sys/block/*
do
    if udevadm info --query=property --path=$device | grep -q ^ID_BUS=usb
    then
        usb=$(echo $device | sed -n 's/^.*\/block\/\(.*\)/\1/p')
        
        if [ ${1} = "/dev/${usb}" ]
        then
            #this is usb drive
            usbdrive=${1}
        fi
        
    fi
done



#set date time
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc

#set locale to en_US.UTF-8 UTF-8
echo -e "en_US.UTF-8 UTF-8\npl_PL.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

#enable NetworkManager, fstrim.timer and resolved
sudo systemctl enable fstrim.timer
systemctl enable NetworkManager.service
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
echo -e "\n127.0.0.1	localhost\n::1		localhost\n127.0.1.1	ARCH\n" >> /etc/hosts

#set root passwd
echo -en "root\nroot" | passwd

#add user
useradd -m tajo48

#set user passwd
echo -en "root\nroot" | passwd tajo48

#set user groups
usermod -aG wheel,audio,video,optical,storage,users tajo48

#set sudo password to no require
sed -i '/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers

#set ssh and ssh-deamon
sed -i '/Port/s/^#//g' /etc/ssh/sshd_config
sed -i '/Port/ s/22/2137/' /etc/ssh/sshd_config
systemctl enable sshd

#set bluetooth.service
systemctl enable bluetooth.service

#mkdir and touch
mkdir /home/tajo48/Downloads /home/tajo48/Desktop /home/tajo48/Pictures /home/tajo48/Git /home/tajo48/Videos /home/tajo48/Wallpapers /home/tajo48/Documents /home/tajo48/Music

#journal setup
#mkdir -p /etc/systemd/journald.conf.d
#echo -e "[Journal]\nStorage=volatile\nSystemMaxUse=16M\nRuntimeMaxUse=32M\n" > /etc/systemd/journald.conf.d/10-volatile.conf

#sed change realtime to noatime and atime in etc/fstab NOT WORKING
#sudo sed -i 's/relatime/noatime/g' /etc/fstab
#sudo sed -i 's/atime/noatime/g' /etc/fstab

#install grub and make config
if [ ${usbdrive} = ${1} ]
then
    echo "pendrive"
    grub-install --target=i386-pc --boot-directory /boot --removable ${1}
    grub-install --target=x86_64-efi --efi-directory /boot --boot-directory /boot --removable
    sleep 10s
else
    echo "hard drive"
    grub-install --target=i386-pc --boot-directory /boot ${1}
    grub-install --target=x86_64-efi --efi-directory /boot --boot-directory /boot
    sleep 10s
fi
grub-mkconfig -o /boot/grub/grub.cfg


#install my config repo
cd /home/tajo48/Git
git clone https://github.com/tajo48/ARCH.git
cp -r /home/tajo48/Git/ARCH /home/tajo48/
rm -rf /home/tajo48/ARCH/.git

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

#nvim
# mkdir /home/tajo48/.config/nvim
# cp /home/tajo48/ARCH/files/init.vim /home/tajo48/.config/nvim/init.vim

#firefox shell integration in gnome
mkdir -p /usr/share/gnome-shell/search-providers/
echo -e "[Shell Search Provider]\nDesktopId=firefox.desktop\nBusName=org.mozilla.Firefox.SearchProvider\nObjectPath=/org/mozilla/Firefox/SearchProvider\nVersion=2" > /usr/share/gnome-shell/search-providers/firefox-search-provider.ini

cd /home/tajo48/Git/
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd /home/tajo48/Git/
git clone https://aur.archlinux.org/webtorrent-cli.git
cd /home/tajo48/Git/
git clone https://aur.archlinux.org/minecraft-launcher.git
cd /home/tajo48/Git/
git clone https://aur.archlinux.org/chrome-gnome-shell.git

su tajo48 << 'NO'
mkdir /home/tajo48/.npm-global
npm config set prefix '/home/tajo48/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" > ~/.profile
NO

#obs with buffer
#echo "obs --startreplaybuffer" > /usr/local/bin/obsqq
#chmod +x /usr/local/bin/obsqq

#chown
chown tajo48 -R /home/tajo48/

#end of script
neofetch

