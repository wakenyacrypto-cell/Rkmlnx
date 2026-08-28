# Rkmlnx Build Guidelines

## Table of Contents
1. [Getting Started](#getting-started)
2. [Prerequisites](#prerequisites)
3. [Build Process](#build-process)
4. [Make Targets](#make-targets)
5. [Configuration](#configuration)
6. [Development Workflow](#development-workflow)
7. [Troubleshooting](#troubleshooting)

---

## Getting Started

Welcome to the Rkmlnx build system! This guide explains how to build and develop the Rkmlnx Linux operating system.

### Quick Start
```bash
# Clone the repository
git clone https://github.com/wakenyacrypto-cell/Rkmlnx.git
cd Rkmlnx

# Check build dependencies
make check-deps

# Build all components
make build

# Create bootable ISO
make iso-image
```

---

## Prerequisites

### Required Build Tools
- **GCC/Clang**: C/C++ compiler (v11.0 or later)
- **Make**: Build automation tool (v4.2 or later)
- **Git**: Version control system
- **Python3**: For build scripts (v3.8+)
- **Perl**: For kernel build scripts
- **Flex & Bison**: Parser generators for kernel
- **libssl-dev**: OpenSSL development libraries
- **bc**: Basic calculator utility

### Installation on Different Systems

#### Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install build-essential gcc g++ make git python3 perl
sudo apt-get install libssl-dev bc flex bison
```

#### Fedora/RHEL
```bash
sudo dnf groupinstall "Development Tools"
sudo dnf install kernel-devel libssl-devel bc flex bison
```

#### Arch Linux
```bash
sudo pacman -S base-devel linux-headers openssl bc flex bison
```

#### macOS
```bash
# Install Xcode Command Line Tools
xcode-select --install

# Install via Homebrew
brew install gcc make python3 perl openssl flex bison
```

### System Requirements
- **Disk Space**: At least 20 GB for full build
- **RAM**: 4 GB minimum (8 GB+ recommended)
- **CPU**: Multi-core processor recommended
- **OS**: Linux, macOS, or WSL2 on Windows

---

## Build Process

### Component Architecture

```
Rkmlnx/
├── bootloader/     # GRUB/UEFI bootloader
├── kernel/         # Linux kernel
├── drivers/        # Device drivers
├── userland/       # Core utilities and libraries
├── services/       # System services (systemd, etc.)
├── desktop/        # Desktop environment
├── tools/          # Development tools
└── docs/           # Documentation
```

### Build Order (Automatically Handled)
1. **Bootloader** - Required for boot
2. **Kernel** - OS core
3. **Drivers** - Hardware support
4. **Userland** - Core utilities
5. **Services** - System services
6. **Desktop** - GUI environment
7. **Tools** - Development utilities

---

## Make Targets

### Primary Targets

#### `make build`
Builds all components in correct order.
```bash
make build
```

#### `make install`
Builds and installs all components to system.
```bash
make install
```

#### `make clean`
Removes all build artifacts.
```bash
make clean
```

#### `make check-deps`
Verifies all build dependencies are installed.
```bash
make check-deps
```

#### `make iso-image`
Creates a bootable ISO file.
```bash
make iso-image
# Output: build/rkmlnx.iso
```

### Component-Specific Targets

#### Kernel
```bash
make kernel-build         # Build kernel only
cd kernel && make config  # Configure kernel
cd kernel && make menuconfig  # Interactive configuration
```

#### Drivers
```bash
make drivers-build        # Build all drivers
cd drivers && make build-all
```

#### Userland
```bash
make userland-build       # Build userland utilities
```

#### Services
```bash
make services-build       # Configure services
```

#### Desktop
```bash
make desktop-build        # Build desktop environment
```

#### Tools
```bash
make tools-build          # Build development tools
```

### Utility Targets

#### `make help`
Displays all available make targets with descriptions.

#### `make version`
Shows current Rkmlnx version.

---

## Configuration

### Environment Configuration

Copy and customize the environment template:
```bash
cp config/.env.example config/.env
nano config/.env
```

### Available Configuration Options

```env
# Build Configuration
BUILD_JOBS=4              # Number of parallel build jobs
BUILD_VERBOSE=0           # Verbose output (0=off, 1=on)
BUILD_CCACHE=1            # Use ccache for faster rebuilds

# Kernel Configuration
KERNEL_VERSION=6.1        # Linux kernel version
KERNEL_ARCH=x86_64        # Target architecture
KERNEL_COMPRESSION=xz     # Compression method

# Bootloader Configuration
BOOTLOADER=grub2          # Bootloader type
UEFI_SUPPORT=1            # UEFI boot support
BIOS_SUPPORT=1            # Legacy BIOS support

# Desktop Environment
DESKTOP_ENV=gnome         # Options: gnome, kde, xfce, i3, minimal
```

### Kernel Configuration

Interactive kernel configuration:
```bash
cd kernel
make menuconfig   # Terminal-based GUI
make xconfig      # X11-based GUI (if installed)
make gconfig      # GTK-based GUI (if installed)
```

### Build Jobs

Control parallel compilation (speeds up builds):
```bash
# Set in config/.env
BUILD_JOBS=8  # Use 8 parallel jobs

# Or override on command line
make build BUILD_JOBS=16
```

---

## Development Workflow

### Setting Up Development Environment

1. **Clone and Setup**
   ```bash
   git clone https://github.com/wakenyacrypto-cell/Rkmlnx.git
   cd Rkmlnx
   cp config/.env.example config/.env
   ```

2. **Install Dependencies**
   ```bash
   make check-deps
   # Install any missing dependencies
   ```

3. **Initial Build**
   ```bash
   make build
   ```

### Making Changes

1. **Choose Component to Modify**
   ```bash
   cd kernel    # or drivers, userland, services, etc.
   ```

2. **Make Your Changes**
   ```bash
   # Edit source files
   nano src/main.c
   ```

3. **Rebuild Component**
   ```bash
   cd component_dir
   make build    # Rebuild only this component
   ```

4. **Test Changes**
   ```bash
   # Test the component
   make test
   ```

### Version Control

1. **Create Feature Branch**
   ```bash
   git checkout -b feature/kernel-optimization
   ```

2. **Commit Changes**
   ```bash
   git add kernel/
   git commit -m "optimize kernel boot time"
   ```

3. **Push and Create PR**
   ```bash
   git push origin feature/kernel-optimization
   # Create Pull Request on GitHub
   ```

---

## Troubleshooting

### Common Issues

#### Missing Build Dependencies
```bash
# Check which dependencies are missing
make check-deps

# Install missing tool, for example:
sudo apt-get install libssl-dev
```

#### Build Fails with "gcc: command not found"
```bash
# Install build tools
sudo apt-get install build-essential

# Or on macOS
xcode-select --install
```

#### Out of Disk Space
```bash
# Check disk usage
df -h

# Clean build artifacts to free space
make clean

# For complete cleanup
make distclean
```

#### Slow Build Performance
```bash
# Increase parallel jobs in config/.env
BUILD_JOBS=16  # Set to number of CPU cores

# Use ccache for faster rebuilds
BUILD_CCACHE=1
sudo apt-get install ccache
```

#### Kernel Configuration Issues
```bash
# Reset kernel configuration
cd kernel
make distclean
make defconfig  # Use default config
make menuconfig # Customize if needed
```

### Getting Help

1. **Check Documentation**
   - docs/BUILD.md - This file
   - docs/ARCHITECTURE.md - System architecture
   - docs/CONTRIBUTING.md - Contributing guidelines

2. **Search Issues**
   - GitHub Issues: https://github.com/wakenyacrypto-cell/Rkmlnx/issues

3. **Report Bugs**
   - Use bug_report.md issue template
   - Include build logs and environment details

4. **Request Features**
   - Use feature_request.md issue template
   - Describe motivation and proposed solution

---

## Advanced Topics

### Cross-Compilation

Build for different architecture:
```bash
make build KERNEL_ARCH=arm64
make build KERNEL_ARCH=armv7l
```

### Custom Kernel

Advanced kernel customization:
```bash
cd kernel

# View all configuration options
make help

# Build with custom config
make KCONFIG=.config.custom

# Generate configuration from running system
make savedefconfig
```

### Optimized Builds

Build with optimizations:
```bash
# Enable all optimizations
make build BUILD_OPTIMIZE=1 BUILD_LTO=1

# Strip binaries for smaller size
make build BUILD_STRIP=1
```

### Incremental Builds

For faster development rebuilds:
```bash
# Only rebuild changed files
make kernel-build

# Partial rebuild of specific directory
cd kernel
make drivers/
```

---

## Performance Optimization

### Ccache Setup
```bash
# Install ccache
sudo apt-get install ccache

# Enable in .env
BUILD_CCACHE=1

# Monitor ccache stats
ccache -s
```

### Parallel Building
```bash
# Best setting: 1-2x number of CPU cores
nproc            # Check number of cores
make build BUILD_JOBS=8  # Adjust accordingly
```

### Dependency Caching
```bash
# First build (full)
time make build

# Rebuild (cached)
time make clean
time make build  # Much faster with ccache
```

---

## Version Information

Current version: **0.1.0-alpha**

Check version:
```bash
make version
cat version.txt
```

---

## License

Rkmlnx is licensed under **GNU General Public License v3.0**

See LICENSE file for details.

---

## Contributing

See docs/CONTRIBUTING.md for guidelines on:
- Code style and standards
- Testing requirements
- Pull request process
- Commit message format

---

**Last Updated**: 2026-08-28  
**Rkmlnx Project Team**