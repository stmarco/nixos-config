#!/bin/sh

cfdisk /dev/sda

1G EFI System
remaining Linux filesystem

lsblk

 mkfs.ext4 -L nixos /dev/sda2

 mkfs.fat -F 32 -n BOOT /dev/sda1

 mount /dev/sda2 /mnt

 mount --mkdir /dev/sda1 /mnt/boot

 lsblk # to see mounted partitions 

nixos-generate-config

cd ~

nixos-install --flake /mnt/etc/nixos#nixos-hyprland

nixos-enter --root /mnt -c 'passwd marco'

reboot


