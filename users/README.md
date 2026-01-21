# Users

This directory contains all **Home Manager entry points** for user configurations.
Each subdirectory represents exactly one Unix user.  
Each file inside a user directory represents the **entry point for a specific host**
and is referenced from the flake.

---

## Structure
```text
users/
├─ jannik/
│  └─ silvermoon.nix
├─ TEMPLATE/
│  └─ hostname.nix
└─ README.md
