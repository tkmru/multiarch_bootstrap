# Multiarch Bootstrap

Multiarch Bootstrap allows to set up testing environment quickly with qemu and debian images for multiple architectures on macOS/ubuntu.

# Supported architectures

- armle
- aarch64
- mipsbe
- mipsle

# How to use
## QEMU and Debian Image Installation

```
$ git clone https://github.com/tkmru/multiarch_bootstrap.git
$ cd multiarch_bootstrap
$ ./install.sh
Do you setup QEMU? [y/N]
y
Installing QEMU...
Updating Homebrew...
...
Do you setup ARMLE Debian Wheezy image? [y/N]
y
Downloading & setting ARMLE Debian Wheezy...
--2018-12-06 12:30:26--  https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2
...
...
Do you setup MIPSBE Debian Wheezy image? [y/N]
...
...
Done
```

## add SSH config

```
$ ./ssh_config.sh
Add VM host to SSH config
```

## launch VM

```
$ ./launch.sh mipsbe
When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2222
Launching Mipsbe machine
```

**NOTE** SSH port depends on the architecture for avoiding `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`.

You can connect VM by `SSH arch_name` after run `ssh_config.sh`.

```
$ ssh mipsbe
```

# Acknowledgments

- [lucyoa/envboot](https://github.com/lucyoa/envboot)
