# Rkmlnx Userland

This directory contains userland components and utilities.

## Contents

### Core Libraries (`lib/`)
- glibc - GNU C Library
- musl - Lightweight C library alternative
- Standard system libraries
- Development headers

### Core Utilities (`utils/`)
- coreutils (ls, cp, mv, rm, etc.)
- POSIX utilities
- Text processing tools
- System utilities

### Package Manager (`pkgmgr/`)
- Package management system
- Dependency resolution
- Repository management
- Installation/removal tools

### Shell & Interpreters (`shells/`)
- bash - GNU Bourne Again Shell
- zsh - Z Shell
- Python interpreter
- Other scripting languages

### System Administration (`sysadmin/`)
- User management
- Group management
- File system management
- System configuration tools

## Build Instructions

```bash
cd userland
make build          # Build all userland components
make install        # Install to system
```

## Development

Userland components are organized modularly to allow independent compilation and testing.

