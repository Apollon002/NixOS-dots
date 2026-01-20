{ ... }:

{
  networking.hostName = "silvermoon";

  ### activate modules ###
  # Pipewire, NetworkManager, Neovim, btop enabled by default
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
    greeter = "dankGreet";

    # Fonts
    fonts.enable = true;

    # Security
    gkr.enable = true;
    kdePolkit.enable = true;

    ### Gaming ###
    gaming.steam.enable = true;
    gaming.heroic.enable = true;
  };
  system.stateVersion = "25.11";
}
