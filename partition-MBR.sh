#!/bin/bash
# Create MBR partition table
parted /dev/sda -- mklabel msdos
# Add root partition
parted /dev/sda -- mkpart primary 1MB -8GB
# Set the root partition’s boot flag to on. This allows the disk to be booted from.
parted /dev/sda -- set 1 boot on
# Finally, add a swap partition.
parted /dev/sda -- mkpart primary linux-swap -8GB 100%

# Formatting
# Assign a unique symbolic label to the file system
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2

mount /dev/disk/by-label/nixos /mnt
# turn swap on
swapon /dev/sda2
# Generate configuration file
nixos-generate-config --root /mnt