#!/usr/bin/bash

cd ~/github/linux_dotfiles

cat retro_magenta/alacritty/alacritty.yml > ~/.config/alacritty/alacritty.yml
cat zsh/.zshrc > ~/.zshrc
cat starship/starship.toml > ~/.config/starship.toml
cat sxhkd/sxhkdrc > ~/.config/sxhkd/sxhkdrc
cat nohang/nohang.conf > ~/.config/nohang/nohang.conf
mkdir ~/.config/rofi_k
cp retro_magenta/rofi/* > ~/.config/rofi_k
cp -r retro_magenta/polybar/ ~/.config/
cat retro_magenta/dunst/dunstrc > ~/.config/dunst/dunstrc
cp -r mpv/ ~/.config/
cat retro_magenta/picom/picom.conf > ~/.config/picom.conf
cat retro_magenta/bspwm/bspwmrc > ~/.config/bspwm/bspwmrc
