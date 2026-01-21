# NixOS System Configuration

Visit this repository online:

[GitHub](https://github.com/Apollon002/NixOS-dots)

## Explanation
This repository contains my NixOS configurations. You are free to use them.
In the following sections, the repository architecture is explained to give an overview
of how the configuration is structured and how it can be modified.

## Structure
The repository consists of five main sections. Four of them are meant to be configured:

### ❄️ flake.nix
This file is the entry point of the entire system. NixOS and Home Manager start their
build process from here. Hosts and users must be defined in this file so they can be built.

To add a new host, add an entry similar to the following and replace the placeholders
marked with `< >`:

```nix
nixosConfigurations.<HOSTNAME> = nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs; };
  system = <SYSTEM_ARCHITECTURE>;
  pkgs = <PACKAGES_FOR_SYSTEM>;
  modules = [
    # Host entry point
    ./hosts/<HOSTNAME>/default.nix
    # System-wide modules
    ./modules/system
  ];
};
```
[^1]: _The system architectures and associated pkgs variables can be found in the_ "let" _block. An example can be found inside_ flake.nix.

Adding a new user works analogously
```nix
homeConfigurations."<USERNAME>@<HOSTNAME>" = home-manager.lib.homeManagerConfiguration {
  pkgs = <PACKAGES FOR SYSTEM ARCHITECTURE>;
  extraSpecialArgs = { inherit inputs; };
  modules = [
    # Import user settings
    ./users/<USERNAME>/<HOSTNAME>.nix
    # user-wide modules
    ./modules/user
  ];
};
```
[^2]: _An example for this can also be found inside_ flake.nix.

To build or update a system on an already installed machine, run:
```bash
sudo nixos-rebuild switch --flake path/to/flake/dir#HOSTNAME
```
[^3]: HOSTNAME _refers to a host defined in_ flake.nix _(see the example)_.

For user configurations via Home Manager:
```bash
home-manager switch --flake path/to/flake/dir#USERNAME@HOSTNAME
```
[^4]: USERNAME@HOSTNAME _refers to a user defined in_ flake.nix _(see the example)_.

### 📁 hosts
Contains all host-specific NixOS configurations and serves as the entry points for the flake.

### 📁 modules
Defines all system-wide and user-wide modules. Programs are configured here and enabled
or disabled from the corresponding host or user configuration.

### 📁 users
Contains all Home Manager user configurations.

## Installation

### Fresh NixOS installation (from installer ISO)
If the hardware configuration matches your system, you can install NixOS directly from
this repository without cloning it:
```bash
sudo nixos-install --flake github:Apollon002/NixOS-dots#HOSTNAME
```

### Custom system installation
If none of the predefined hosts match your hardware, clone the repository, create a new
host and user using the provided templates, and then run:
```bash
sudo nixos-install --flake path/to/flake/dir#HOSTNAME
```

### Updating an existing system
On an already installed system, apply changes using:
```bash
sudo nixos-rebuild switch --flake github:Apollon002/NixOS-dots#HOSTNAME
```

### User configuration (Home Manager)
Apply user configurations either from the remote repository:
```bash
home-manager switch --flake github:Apollon002/NixOS-dots#USERNAME@HOSTNAME
```

or from a local clone:
```bash
home-manager switch --flake path/to/flake/dir#USERNAME@HOSTNAME
```

## Credits

This configuration was inspired by and benefited from the dotfiles of:

- [librephoenix](https://github.com/librephoenix/nixos-config)
