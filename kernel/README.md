# Rkmlnx Kernel

This directory contains the Linux kernel source and Rkmlnx-specific customizations.

## Contents

- `src/` - Linux kernel source code
- `patches/` - Custom patches for Rkmlnx
- `config/` - Kernel configuration files
- `modules/` - Loadable kernel modules

## Build Instructions

```bash
cd kernel
make config        # Configure kernel
make build         # Compile kernel
make install       # Install kernel
```

## Configuration

Kernel configuration is managed via `.config` files. Use `make menuconfig` for interactive configuration.

## Supported Architectures

- x86_64
- ARM64
- (Additional architectures coming soon)

