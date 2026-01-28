# System Modules

This directory contains all NixOS system modules used by this configuration.
Each module is responsible for a specific system concern and can be enabled or
configured from the host configuration.

The structure is intentionally modular to keep host definitions minimal and to
maximize reuse across machines.

Note: Some categories allow only one module to be enabled at a time
(e.g. kernels, graphics, greeter). This is indicated explicitly in the overview.

---

Module Overview

admin
- System administration tools
- btop: system resource monitor
- neovim: system-wide Neovim setup

audio
- Audio stack configuration
- pipewire: PipeWire-based audio setup

appImage
- enables appimages with appimage-run

base
- Base system configuration used by all hosts

bluetooth
- Bluetooth support and services

bootloader
- Bootloader configuration
- grub
- systemdBoot

fonts
- System-wide font installation and configuration

gaming
- Gaming-related system setup
- steam
- heroic
- minecraft
- faugus
- gpu-screen-recorder

graphics (only one at a time)
- GPU and graphics stack configuration
- amd
- nvidia

greeter (only one at a time)
- Display manager and login greeter configuration
- dank_greet
- ly

kernels (only one at a time)
- Kernel selection and configuration
- linux
- zen

network
- Networking configuration
- network-manager

powerprofiles
- CPU power and performance profile configuration

printing
- Printing and scanning support
- cups
- sane

security
- Authentication and privilege handling
- gnome-keyring
- kde-polkit

shells
- System-wide shell configuration
- fish
- zsh

users
- System user and group definitions **CHANGE INITIAL PASSWORD RIGHT AFTER CREATION, ITS PUBLIC!**

wm
- Window manager / compositor configuration
- niri

---

Module Activation

Modules are enabled from the host configuration using the following syntax:
```nix
systemSettings.<category>.<module>.enable = true;
```
If only one module in a category can be active at a time, use:
```nix
systemSettings.<category> = "<module>";
```
