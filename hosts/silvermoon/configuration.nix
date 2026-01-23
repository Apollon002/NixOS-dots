{ pkgs, ... }:

{
  networking.hostName = "silvermoon";

  ########################
  ### Activate modules ###
  ########################
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

    ### AppImages ###
    appImage.enable = true;

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

    ### Printing ###
    printing = {
      cups.enable = true;
      sane.enable = true;
    };

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
  ### PRINTER DRIVERS ###
  # If needed add additional printer drivers here
  services.printing.drivers = [ ];

  ### specify shells for every user ###
  users.users.jannik.shell = pkgs.fish;

  # DO NOT TOUCH
  system.stateVersion = "26.05";
}
