#!/bin/sh

cfdisk /dev/sda

1G EFI System
remaining Linux filesystem

lsblk

 mkfs.ext4 -L nixos /dev/sda2

 mkfs.fat -F 32 -n BOOT /dev/sda1

 mount /dev/sda2 /mnt
 mkdir -p /mnt/boot

 mount -o umask=077 /dev/sda1 /mnt/boot

 lsblk # to see mounted partitions 

nixos-generate-config --root /mnt

cd ~

nixos-install --flake /mnt/etc/nixos#nixos-hyprland

nixos-enter --root /mnt -c 'passwd marco'

reboot


