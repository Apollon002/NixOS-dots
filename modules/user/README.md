# User Modules

This directory contains all **Home Manager user modules** used by this configuration.
These modules define user-scoped programs, tools, and UI-related settings and are
applied per user via Home Manager.

The separation from system modules ensures a clear boundary between what is managed
by NixOS and what is managed at the user level.

---

Module Overview

browsers
- Web browsers
- librewolf

dev
- Development-related tools and environments
- tex
- typst

editor
- Editor configuration and tooling
- zed
- lsps
  - nixlsp
- formatter
  - nixfmt

file_browsers (only one at a time)
- Graphical file managers
- nemo

fonts
- User-installed fonts
- fira_nerd
- roboto

icons
- Icon themes and cursors
- papirus
- bibata_cursor

office
- Office and communication software
- onlyoffice
- teams

programs
- User applications and utilities
- amberol
- bitwarden
- evince
- ghumb
- megacmd (with autostart option)
- microfetch
- simple-scan
- spotify
- starship
- vesktop

shells
- User shell configuration
- fish

terminals
- Terminal emulators
- kitty

ui
- User interface and theming
- dms
- gtk
- matugen
- pywalfox

wm
- User-level window manager configuration
- niri

---

Module Activation

User modules are enabled from the Home Manager configuration using:

```nix
userSettings.<category>.<module>.enable = true;
```

If only one module in a category can be active at a time, use:
```nix
userSettings.<category> = "<module>";
```

Some categories are structured as feature groups and may expose additional options
instead of a single enable flag. For example, librewolf can specify a profile to use (see `users/TEMPLATE/hostname.nix`).
