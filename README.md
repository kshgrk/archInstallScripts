# archInstallScripts
Installs base-arch system after chrooting into the /mnt folder. (arch_install.sh) <br>
Installs bspwm with required pkgs eg: sxhkd, rofi, etc. (bspwm.sh) <br>
Copyies config files from [linux_dotfiles](https://github.com/kshgrk/linux_dotfiles) locally. (magic.sh)

## Procedure
First you need to provide executable access to every script. You can do that by going inside the repo and running this command

```bash
chmod +x *.sh
```
Now you can just run the respective script by an example command like this.

```bash
./arch_install.sh
```

## IMPORTANT
1. You must have an active internet connection.
2. Currently it is very specific (working on it....), but if you have some knowledge about arch-installation you can modify as you like.
3. The magic.sh script makes the clone of [linux_dotfiles](https://github.com/kshgrk/linux_dotfiles) repo inside a new folder named ```github``` in your home directory.
