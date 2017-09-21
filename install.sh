#!/bin/bash
set -eu

is_setup() {
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0 ;;
      [nN]o | 'N') return 1 ;;
      *) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}

if is_setup 'QEMU'; then
  echo "Installing QEMU..."
  if [ "$(uname)" == 'Darwin' ]; then
    brew install qemu
  elif [ "$(expr substr $(uname -n) 1 6)" == 'ubuntu' ]; then
    apt-get install -y qemu-system-arm qemu-system-mips qemu-system-mipsel
  fi
fi

if [ ! -d $HOME/qcow ]; then
  mkdir ~/qcow
fi

if is_setup 'ARMLE Debian Wheezy image'; then
  echo -e "\nDownloading & setting ARMLE Debian Wheezy..."
  mkdir ~/qcow/armle
  wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2 -O ~/qcow/armle/debian_wheezy_armel_standard.qcow2
  wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile -O ~/qcow/armle/initrd.img-3.2.0-4-versatile
  wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile -O ~/qcow/armle/vmlinuz-3.2.0-4-versatile
fi

if is_setup 'MIPSBE Debian Wheezy image'; then
  echo -e "\nDownloading & setting MIPSBE Debian Wheezy..."
  mkdir ~/qcow/mipsbe
  wget https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2 -O ~/qcow/mipsbe/debian_wheezy_mips_standard.qcow2
  wget https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta -O ~/qcow/mipsbe/vmlinux-3.2.0-4-4kc-malta
fi

if is_setup 'MIPSLE Debian Wheezy image'; then
  echo -e "\nDownloading & setting MIPSLE Debian Wheezy..."
  mkdir ~/qcow/mipsle
  wget https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2 -O ~/qcow/mipsle/debian_wheezy_mipsel_standard.qcow2
  wget https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta -O ~/qcow/mipsle/vmlinux-3.2.0-4-4kc-malta
fi

if is_setup 'AArch64 Debian Wheezy image'; then
  echo -e "\nDownloading & setting AArch64 Ubuntu Trusty..."
  mkdir ~/qcow/aarch64
  wget https://cloud-images.ubuntu.com/trusty/current/unpacked/trusty-server-cloudimg-arm64-vmlinuz-generic -O ~/qcow/aarch64/trusty-server-cloudimg-arm64-vmlinuz-generic
  wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-arm64-disk1.img -O ~/qcow/aarch64/trusty-server-cloudimg-arm64-disk1.img
fi

echo "Done"
