# Rkmlnx Desktop Environment

This directory contains desktop environment components and graphical interfaces.

## Contents

### Display Server (`display/`)
- X11/Xorg configuration
- Wayland support
- Display protocols

### Window Manager (`wm/`)
- GNOME
- KDE Plasma
- i3 (minimal tiling WM)
- OpenBox
- Lightweight alternatives

### Desktop Components (`components/`)
- Panel/Taskbar
- File manager
- Terminal emulator
- Application menu
- Settings manager

### Themes & Customization (`themes/`)
- GTK themes
- Icon themes
- Color schemes
- Window decoration

## Installation

```bash
cd desktop
make install-<environment>   # Install specific DE
```

## Available Desktops

- GNOME - Full-featured modern desktop
- KDE Plasma - Feature-rich and customizable
- i3 - Lightweight tiling window manager
- XFCE - Lightweight and fast
- Minimal - Base X11 configuration

