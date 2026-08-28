# Rkmlnx Architecture

## System Overview

Rkmlnx is a modular Linux-based operating system composed of several key components that work together to provide a complete, functional OS.

## Component Hierarchy

### 1. Bootloader
- **GRUB 2** for legacy BIOS and UEFI
- Responsible for loading kernel into memory
- Supports multiple boot configurations

### 2. Linux Kernel
- Based on mainline Linux kernel (v6.1+)
- Modular architecture
- Hardware abstraction layer

### 3. Device Drivers
- Graphics drivers
- Network drivers
- Storage drivers
- Input device drivers

### 4. Userland
- GNU C Library (glibc)
- Core utilities (coreutils)
- Shell (bash)
- Package management

### 5. System Services
- Init system (systemd)
- Logging (journald)
- Device management (udev)
- Network management

### 6. Desktop Environment
- Window manager
- Desktop manager
- Applications
- Display manager

### 7. Development Tools
- Compiler toolchain
- Debugger
- Build tools
- Version control

## Build Dependencies

```
Bootloader
    ↓
  Kernel
    ↓
  Drivers
    ↓
  Userland
    ↓
 Services
    ↓
  Desktop
    ↓
   Tools
```

See BUILD.md for detailed build instructions.