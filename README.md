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
$ git clone https://github.com/tkmru/qcow_bootstrap.git
$ cd qcow_bootstrap
$ ./install.sh
Installing QEMU
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
