{ pkgs, ... }:

{
  networking.hostName = "darkshire";

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
    appImage.enable = false;

    ### Bluetooth ###
    bluetooth.enable = true;

    ### Bootloader ###
    bootloader = "systemdboot";

    ### Fonts ###
    fonts.enable = true;

    ### Gaming ###
    gaming = {
      heroic.enable = false;
      minecraft.enable = false;
      steam.enable = false;
    };

    ### Graphics driver ###
    graphics = "amd";

    ### Greeter ###
    greeter = "dankGreet"; # DANK-GREET COULD HAVE LIMITED FUNCTIONALITY WITHOUT DANK MATERIAL SHELL!

    ### Kernels ###
    kernel = "linux";

    ### network ###
    network = {
      networkManager.enable = true;
    };

    ### Powerprofiles ###
    powerProfiles.enable = true;

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
  users.users.jannik.shell = pkgs.fish; # e.g. pkgs.fish

  # SET TO THE SYSTEM VERSION YOU INSTALL WITH THE ISO, DO NOT TOUCH AFTER
  system.stateVersion = "26.05";
}
