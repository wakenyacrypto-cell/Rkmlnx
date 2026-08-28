# Rkmlnx Bootloader

This directory contains bootloader components for Rkmlnx.

## Contents

- `grub/` - GRUB2 configuration and customizations
- `uefi/` - UEFI boot support
- `bios/` - Legacy BIOS boot support
- `config/` - Bootloader configuration files

## Build Instructions

```bash
cd bootloader
make build
```

## Configuration

Bootloader configuration is managed through GRUB2 menuentry definitions. Custom boot parameters can be added in `config/grub.cfg`.

