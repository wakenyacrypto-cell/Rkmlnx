# Rkmlnx Drivers

This directory contains hardware drivers and device support for Rkmlnx.

## Driver Categories

### Character Devices (`char/`)
- Serial ports
- TTY devices
- Random number generators
- Other character-based devices

### Block Devices (`block/`)
- SATA/NVME drivers
- RAID controllers
- USB storage
- Other block storage devices

### Network Drivers (`net/`)
- Ethernet drivers
- WiFi drivers
- Virtual network interfaces
- Network protocols

### GPU/Display Drivers (`gpu/`)
- AMD Radeon
- NVIDIA (Nouveau, proprietary)
- Intel integrated graphics
- Display output support

### Audio Drivers (`audio/`)
- Sound card drivers
- ALSA/PulseAudio support
- Microphone input

### Input Devices (`input/`)
- Keyboard drivers
- Mouse/touchpad drivers
- Joystick support
- Touch screen support

## Building Drivers

```bash
cd drivers
make build-all      # Build all drivers
make build-<category>  # Build specific category
```

## Driver Development

New drivers should follow the Linux kernel coding standards and be submitted with proper documentation.

