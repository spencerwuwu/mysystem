#!/bin/sh
set -e
# This is a shell script used to install archlinux on an amd64 machine with UEFI.
# Make sure the network connection is fine and execute this script with root privilege.

# update the system clock
timedatectl set-ntp true

# prepare the disk
parted --script /dev/sda mklabel gpt
parted --script /dev/sda mkpart ESP fat32 1M 100M
parted --script /dev/sda set 1 boot on
parted --script /dev/sda mkpart primary linux-swap 100M 3G
parted --script /dev/sda mkpart primary ext4 3G 100%
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2

# mount the partitions
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# set up the mirrorlist
sed -i -e '1s/^/## Taiwan\
Server = http:\/\/archlinux.cs.nctu.edu.tw\/\$repo\/os\/\$arch\
Server = http:\/\/shadow.ind.ntou.edu.tw\/archlinux\/\$repo\/os\/\$arch\
Server = http:\/\/ftp.tku.edu.tw\/Linux\/ArchLinux\/\$repo\/os\/\$arch\
Server = http:\/\/ftp.yzu.edu.tw\/Linux\/archlinux\/\$repo\/os\/\$arch\
/' /etc/pacman.d/mirrorlist

# install the base
pacstrap /mnt base base-devel

# genfstab
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

# generate archsetup.sh file
echo "#!/bin/sh

# set up locale, time, hostname, password
echo \"en_US.UTF-8 UTF-8
zh_TW.UTF-8 UTF-8\" > /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc --utc
echo arch64 > /etc/hostname
passwd

# install a boot loader
bootctl install
echo \"title	Arch Linux
linux	/vmlinuz-linux
initrd	/intel-ucode.img
initrd	/initramfs-linux.img
options	root=PARTUUID=\$(blkid -s PARTUUID -o value /dev/sda3) rw i915.enable_psr=0\" > /boot/loader/entries/arch.conf
echo \"default	arch
timeout	0
editor	0\" > /boot/loader/loader.conf

# Pre-installation
pacman -Syu --noconfirm --needed intel-ucode wpa_supplicant bash-completion gcc gdb vim ctags openssh gnupg git valgrind dialog wget curl tmux zip unzip p7zip unrar abs

# Dhcpcd
systemctl enable dhcpcd.service
" > /mnt/archsetup.sh

# chroot
echo "chroot into the new system..."
arch-chroot /mnt /bin/bash /archsetup.sh

# umount
rm -f /mnt/archsetup.sh
umount -R /mnt
sync
poweroff

# remember to remove the installation media
# before booting again
