# Qcow Bootstrap

 Qcow Bootstrap allows to set up testing environment quickly with qemu and debian images for multiple architectures on macOS.

# Supported architectures

- armle
- aarch64
- mipsbe
- mipsle

# Installation

```
git clone https://github.com/tkmru/qcow_bootstrap.git
cd qcow_bootstrap
./install.sh
```

# How to use

```
$ ./launch.sh mipsbe
When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2222
Launching Mipsbe machine
```

**NOTE** SSH port depends on the architecture for avoiding ```WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!```.

# Acknowledgments

- [lucyoa/envboot](https://github.com/lucyoa/envboot)
