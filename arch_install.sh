#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Arch" >> /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   arch.localdomain    Arch" >> /etc/hosts
echo root:password | chpasswd

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-zen-headers bluez bluez-utils alsa-utils pulseaudio pavucontrol pulseaudio-bluetooth rsync acpi tlp os-prober ntfs-3g xf86-video-amdgpu nvidia-utils nvidia nvidia-settings

grub-install --target =x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH
grub-mkconfig -o /boot/efi/grub.cfg
echo "GRUB_DISABLE_OS_PROBER=false"
grub-mkconfig -o /boot/efi/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable tlp
systemctl enable NetworkManager
systemctl enable NetworkManager

useradd -m kshgrk
echo kshgrk:password | chpasswd
usermod -aG libvirt kshgrk

echo "kshgrk ALL=(ALL) ALL" >> /etc/sudoers.d/kshgrk

print "\e Done!, Now type [exit, unmout -a and reboot]"

