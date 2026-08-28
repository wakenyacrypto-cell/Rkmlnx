# Rkmlnx Build Guide

This guide provides instructions for building Rkmlnx from source.

## Prerequisites

### System Requirements
- 4GB RAM minimum (8GB recommended)
- 50GB free disk space
- x86_64 or ARM64 architecture
- Linux-based build system

### Build Tools
```bash
sudo apt-get install build-essential git ncurses-dev bison flex \
    libssl-dev libelf-dev bc python3 rsync
```

## Build Steps

### 1. Clone the Repository
```bash
git clone https://github.com/wakenyacrypto-cell/Rkmlnx.git
cd Rkmlnx
```

### 2. Configure Components
```bash
# Configure kernel
cd kernel
make menuconfig
cd ..

# Configure bootloader
cd bootloader
make config
cd ..
```

### 3. Build Components

#### Build Bootloader
```bash
cd bootloader
make build
cd ..
```

#### Build Kernel
```bash
cd kernel
make build
make modules
cd ..
```

#### Build Drivers
```bash
cd drivers
make build-all
cd ..
```

#### Build Userland
```bash
cd userland
make build
cd ..
```

#### Build Desktop Environment
```bash
cd desktop
make install-gnome  # or another DE
cd ..
```

### 4. Create Installation Image
```bash
make iso-image
```

### 5. Install to Media
```bash
sudo dd if=rkmlnx.iso of=/dev/sdX bs=4M status=progress
sync
```

## Customization

See `ARCHITECTURE.md` for component-specific customization options.

## Troubleshooting

### Build Failures
- Ensure all prerequisites are installed
- Check that you're using a compatible architecture
- Review component-specific README files

### Missing Dependencies
- Run: `make check-deps` to verify all requirements
- Install missing packages as indicated

### Performance Issues
- Reduce build parallelism: `make -j2` instead of default
- Ensure sufficient disk space and RAM

## Support

For issues, please open an issue on the GitHub repository or consult the documentation.

