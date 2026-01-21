{ pkgs, ... }:

{
  networking.hostName = "silvermoon";

  ### activate modules ###
  # Pipewire, NetworkManager, Neovim, btop enabled by default
  systemSettings = {
    ### Create users ###
    users = [ "jannik" ];
    sudoUsers = [ "jannik" ];

    ### Admin ###
    admin = {
      btop.enable = true;
      neovim.enable = true;
    };

    ### Audio ###
    audio = {
      pipewire.enable = true;
    };

    ### Bluetooth ###
    bluetooth.enable = true;

    ### Bootloader ###
    bootloader = "grub";

    ### Fonts ###
    fonts.enable = true;

    ### Gaming ###
    gaming = {
      heroic.enable = true;
      minecraft.enable = true;
      steam.enable = true;
    };

    ### Graphics driver ###
    graphics = "nvidia";

    ### Greeter ###
    greeter = "dankGreet";

    ### Kernels ###
    kernel = "zen";

    ### network ###
    network = {
      networkManager.enable = true;
    };

    ### Powerprofiles ###
    powerProfiles.enable = false;

    ### Security ###
    security = {
      gkr.enable = true;
      kdePolkit.enable = true;
    };

    ### Shells ###
    shells = {
      fish.enable = true;
      zsh.enable = false;
    };

    ### Window-Manager ###
    wm = {
      niri.enable = true;
    };
  };

  # specify shells for every user
  users.users.jannik.shell = pkgs.fish;

  system.stateVersion = "25.11";
}
