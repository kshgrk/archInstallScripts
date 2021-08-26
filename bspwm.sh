#!/usr/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo pacman -Sy

sudo pacman -S xorg lightdm polkit firefox bspwm sxhkd mpv ttf-fantasque-sans-mono polybar nerd-fonts-jetbrains-mono feh rofi starship exa fzf pcmanfm nohang picom-jonaburg-git otf-material-icons-git lightdm-gtk-greeter zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting i3lock

sudo systemctl enable display-manager.service
sudo systemctl enable polkit.service
sudo systemctl enable nohang.service

sudo chsh -s /usr/bin/zsh

mkdir ~/github/
git clone https://github.com/kshgrk/dotfiles_linux

echo "Now Reboot, If u are greeted by lightdm then the installation went fine otherwise try manual installation."


