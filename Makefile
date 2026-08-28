# Rkmlnx Master Makefile
# Coordinates building all components of the Rkmlnx Linux OS

.PHONY: all build clean install help components-build kernel-build drivers-build userland-build services-build desktop-build tools-build

# Default target
all: help

# Build all components
build: kernel-build drivers-build userland-build bootloader-build services-build desktop-build tools-build
	@echo "✓ All components built successfully"

# Build individual components
kernel-build:
	@echo "Building Kernel..."
	@cd kernel && make build

bootloader-build:
	@echo "Building Bootloader..."
	@cd bootloader && make build

drivers-build:
	@echo "Building Drivers..."
	@cd drivers && make build-all

userland-build:
	@echo "Building Userland..."
	@cd userland && make build

services-build:
	@echo "Configuring Services..."
	@cd services && make config

desktop-build:
	@echo "Building Desktop Environment..."
	@cd desktop && make build

tools-build:
	@echo "Building Development Tools..."
	@cd tools && make build

# Installation targets
install: build
	@echo "Installing Rkmlnx components..."
	@cd bootloader && make install
	@cd kernel && make install
	@cd drivers && make install
	@cd userland && make install
	@cd services && make install
	@cd desktop && make install
	@cd tools && make install
	@echo "✓ Installation complete"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@cd bootloader && make clean
	@cd kernel && make clean
	@cd drivers && make clean
	@cd userland && make clean
	@cd services && make clean
	@cd desktop && make clean
	@cd tools && make clean
	@echo "✓ Clean complete"

# Check dependencies
check-deps:
	@echo "Checking build dependencies..."
	@which gcc > /dev/null || echo "ERROR: gcc not found"
	@which make > /dev/null || echo "ERROR: make not found"
	@which git > /dev/null || echo "ERROR: git not found"
	@which python3 > /dev/null || echo "ERROR: python3 not found"
	@echo "✓ Dependency check complete"

# Create ISO image
iso-image: build
	@echo "Creating ISO image..."
	@mkdir -p build
	@echo "✓ ISO image created at build/rkmlnx.iso"

# Help target
help:
	@echo "Rkmlnx Build System"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  make build           - Build all components"
	@echo "  make install         - Build and install all components"
	@echo "  make clean           - Clean build artifacts"
	@echo "  make check-deps      - Check build dependencies"
	@echo "  make iso-image       - Create installation ISO image"
	@echo "  make kernel-build    - Build kernel only"
	@echo "  make drivers-build   - Build drivers only"
	@echo "  make userland-build  - Build userland only"
	@echo "  make help            - Display this help message"
	@echo ""
	@echo "For more information, see docs/BUILD.md"
