# Modules

This directory contains all reusable **NixOS** and **Home Manager** modules used by
this configuration.

The modules are intentionally split to clearly separate what is managed by the
NixOS system and what is managed on a per-user basis via Home Manager.

---

## Structure

```text
modules/
├─ system/
│  └─ ...
├─ user/
│  └─ ...
└─ README.md
```

## `system/`
Contains NixOS modules that are applied system-wide.

Typical responsibilities:

- system services and daemons

- hardware, graphics, audio, networking

- bootloader and kernel options

- system-wide programs and settings

- These modules are enabled from the host configuration.

## `user/`
Contains Home Manager modules that are applied per user.

Typical responsibilities:

- user applications

- shell and editor configuration

- theming and UI settings

- per-user services

- These modules are enabled from the user configuration.
