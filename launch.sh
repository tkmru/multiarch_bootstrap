#!/bin/bash

if [[ $1 == "mipsle" ]]; then
  echo "When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2222"
  echo "Launching Mipsle machine"
  qemu-system-mipsel -M malta -kernel ~/qcow/mipsle/vmlinux-3.2.0-4-4kc-malta -hda ~/qcow/mipsle/debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0" -net nic -net user,hostfwd=tcp::2222-:22
fi

if [[ $1 == "mipsbe" ]]; then
  echo "When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2223"
  echo "Launching Mipsbe machine"
  qemu-system-mips -M malta -kernel ~/qcow/mipsbe/vmlinux-3.2.0-4-4kc-malta -hda ~/qcow/mipsbe/debian_wheezy_mips_standard.qcow2 -append "root=/dev/sda1 console=tty0" -net nic -net user,hostfwd=tcp::2223-:22
fi

if [[ $1 == "armle" ]]; then
  echo "When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2224"
  echo "Launching Armle machine"
  qemu-system-arm -M versatilepb -kernel ~/qcow/armle/vmlinuz-3.2.0-4-versatile -initrd ~/qcow/armle/initrd.img-3.2.0-4-versatile -hda ~/qcow/armle/debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1" -net nic -net user,hostfwd=tcp::2224-:22
fi

if [[ $1 == "aarch64" ]]; then
  echo "When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2225"
  echo "Launching aarch64 machine"
  qemu-system-aarch64 -m 1024 -cpu cortex-a57 -nographic -machine virt -kernel ~/qcow/aarch64/trusty-server-cloudimg-arm64-vmlinuz-generic \
    -append 'root=/dev/vda1 rw rootwait mem=1024M console=ttyAMA0,38400n8 init=/usr/lib/cloud-init/uncloud-init ds=nocloud ubuntu-pass=randomstring' \
    -drive if=none,id=image,file=~/qcow/aarch64/trusty-server-cloudimg-arm64-disk1.img \
    -device virtio-blk-device,drive=image \
    -device virtio-net-device,netdev=user0 \
    -netdev user,id=user0,hostfwd=tcp::2225-:22
fi
