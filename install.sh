#!/bin/bash

echo "Installing Qemu"
brew install qemu

mkdir ~/qcow

echo -e "\nDownloading & setting ARMLE Debian Wheezy"
mkdir ~/qcow/armle
wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2 -O ~/qcow/armle/debian_wheezy_armel_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile -O ~/qcow/armle/initrd.img-3.2.0-4-versatile
wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile -O ~/qcow/armle/vmlinuz-3.2.0-4-versatile

echo -e "\nDownloading & setting MIPSBE Debian Wheezy"
mkdir ~/qcow/mipsbe
wget https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2 -O ~/qcow/mipsbe/debian_wheezy_mips_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta -O ~/qcow/mipsbe/vmlinux-3.2.0-4-4kc-malta

echo -e "\nDownloading & setting MIPSLE Debian Wheezy"
mkdir ~/qcow/mipsle
wget https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2 -O ~/qcow/mipsle/debian_wheezy_mipsel_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta -O ~/qcow/mipsle/vmlinux-3.2.0-4-4kc-malta

echo -e "\nDownloading & setting AArch64 Debian Wheezy"
mkdir ~/qcow/aarch64
wget https://cloud-images.ubuntu.com/trusty/current/unpacked/trusty-server-cloudimg-arm64-vmlinuz-generic -O ~/qcow/aarch64/trusty-server-cloudimg-arm64-vmlinuz-generic
wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-arm64-disk1.img -O ~/qcow/aarch64/trusty-server-cloudimg-arm64-disk1.img

echo "Done"
