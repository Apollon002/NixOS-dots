{ ... }:

{
  networking.hostName = "silvermoon";

  ### activate modules ###
  # Pipewire, NetworkManager, Neovim, dgop enabled by default
  systemSettings = {
    # Create users
    users = [ "jannik" ];
    sudoUsers = [ "jannik" ];

    # Shell
    shell = "fish";

    # Window-Manager
    niri.enable = true;

    # Hardware
    kernel = "zen";
    bluetooth.enable = true;
    graphics = "nvidia";
    powerProfiles.enable = true;

    # Software
    bootloader = "grub";
    greeter = "ly";

    # Fonts
    fonts.enable = true;

    # Security
    gkr.enable = true;
    kdePolkit.enable = true;
  };
  system.stateVersion = "25.11";
}
