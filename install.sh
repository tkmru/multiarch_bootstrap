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
  elif [ "$(uname -n)" == 'ubuntu' ]; then
    sudo apt install -y qemu-system-arm qemu-system-mips
  fi
fi


if is_setup 'ARMLE Debian Wheezy image'; then
  echo -e "Downloading & setting ARMLE Debian Wheezy..."
  mkdir -p ~/qcow2/armle
  wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2 -O ~/qcow2/armle/debian_wheezy_armel_standard.qcow2
  wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile -O ~/qcow2/armle/initrd.img-3.2.0-4-versatile
  wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile -O ~/qcow2/armle/vmlinuz-3.2.0-4-versatile
fi

if is_setup 'MIPSBE Debian Wheezy image'; then
  echo -e "Downloading & setting MIPSBE Debian Wheezy..."
  mkdir -p ~/qcow2/mipsbe
  wget https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2 -O ~/qcow2/mipsbe/debian_wheezy_mips_standard.qcow2
  wget https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta -O ~/qcow2/mipsbe/vmlinux-3.2.0-4-4kc-malta
fi

if is_setup 'MIPSLE Debian Wheezy image'; then
  echo -e "Downloading & setting MIPSLE Debian Wheezy..."
  mkdir -p ~/qcow2/mipsle
  wget https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2 -O ~/qcow2/mipsle/debian_wheezy_mipsel_standard.qcow2
  wget https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta -O ~/qcow2/mipsle/vmlinux-3.2.0-4-4kc-malta
fi

if is_setup 'AArch64 Debian Wheezy image'; then
  echo -e "Downloading & setting AArch64 Ubuntu Trusty..."
  mkdir -p ~/qcow2/aarch64
  wget https://cloud-images.ubuntu.com/trusty/current/unpacked/trusty-server-cloudimg-arm64-vmlinuz-generic -O ~/qcow2/aarch64/trusty-server-cloudimg-arm64-vmlinuz-generic
  wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-arm64-disk1.img -O ~/qcow2/aarch64/trusty-server-cloudimg-arm64-disk1.img
fi

echo "Done"
