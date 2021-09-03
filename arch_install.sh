#!/bin/bash  
  
# Read the user input   
  
echo "Enter the user-name: "  
read usrname  
echo "User Name will be $usrname"  

timez="0"
echo -en "\e[1m\e[33m  Now set your local time zone \e[0m\\n\\n"

while [ "$timez" == "0" ]
do
    echo -en "  If don\'t know your time zone then you can use following command to list all available time zones\\n\\n"
    echo -en "\e[1m\e[4m"$ timedatectl list-timezones"\e[0m\\n\\n"
    echo -en "  or you can visit \e[1mhttp://www.timezoneconverter.com/cgi-bin/findzone.tzc\e[0m to find your time zone \\n\\n"
    echo "  enter Time Zone,  "
    echo "  Example for Asia/Kolkata, enter Asia Kolkata (separated by single space)"
    printf "===> "
    read T1 T2
    ls /usr/share/zoneinfo/*/* | grep ${T1}/${T2} && echo " A match found for your time zone " && timez="1"
    if [ "${timez}" == "1" ]
    then
        echo -en "\e[32m\e[1m  Success\e[0m\\n"
        
        ln -sf /usr/share/zoneinfo/${T1}/${T2} /etc/localtime
        
        echo -en "created symlink \e[32m/etc/localtime/usr/share/zoneinfo/$T1/$T2-->/etc/localtime \e[0m\\n\\n"
    else
        echo -en " \\n\e[31m\e[1m wrong input try again\e[0m\\n\\n"
    fi
done


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

useradd -m $usrname
echo $usrname:password | chpasswd
usermod -aG libvirt $usrname

echo "$usrname ALL=(ALL) ALL" >> /etc/sudoers.d/$usrname

print "\e Done!, Now type [exit, unmout -a and reboot]"

