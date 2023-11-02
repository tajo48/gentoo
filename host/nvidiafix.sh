#! /bin/bash

sudo emerge --autounmask=y --autounmask-continue=y x11-drivers/nvidia-drivers

# Purpose: Fix the nvidia driver issue
# change #GRUB_CMDLINE_LINUX="" to GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"
sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"/g' /etc/default/grub
#uncomment #GRUB_CMDLINE_LINUX
sudo sed -i 's/#GRUB_CMDLINE_LINUX/GRUB_CMDLINE_LINUX/g' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
