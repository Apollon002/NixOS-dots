{ pkgs, ... }:

{
  networking.hostName = "ENTER HOSTNAME HERE";

  ########################
  ### Activate modules ###
  ########################
  systemSettings = {

    # EVERY MODULE WITH THE "enable" PROPERTY CAN BE TURNED ON BY SETTING IT TO "true". THEY ARE "false" BY DEFAULT

    ### Create users ###
    users = [ "ENTER USERS TO CREATE HERE (seperated with spaces)" ];
    sudoUsers = [ "ENTER USERS FROM 'users'-list HERE TO GRANT THEM SUDO PRIVILEGES" ];

    ### Admin ###
    admin = {
      btop.enable = false;
      neovim.enable = false;
    };

    ### Audio ###
    audio = {
      pipewire.enable = false;
    };

    ### Bluetooth ###
    bluetooth.enable = false;

    ### Bootloader ###
    bootloader = "ENTER BOOTLOADER TO USE (grub or systemdboot)";

    ### Fonts ###
    fonts.enable = false;

    ### Gaming ###
    gaming = {
      heroic.enable = false;
      minecraft.enable = false;
      steam.enable = false;
    };

    ### Graphics driver ###
    graphics = "ENTER GRAPHICS DRIVERS TO INSTALL (nvidia or amd)";

    ### Greeter ###
    greeter = "ENTER GREETER TO USE (ly or dankGreet)"; # DANK-GREET COULD HAVE LIMITED FUNCTIONALITY WITHOUT DANK MATERIAL SHELL!

    ### Kernels ###
    kernel = "ENTER KERNEL TO USE (linux or zen)";

    ### network ###
    network = {
      networkManager.enable = false;
    };

    ### Powerprofiles ###
    powerProfiles.enable = false;

    ### Printing ###
    printing = {
      cups.enable = false;
      sane.enable = false;
    };

    ### Security ###
    security = {
      gkr.enable = false;
      kdePolkit.enable = false;
    };

    ### Shells ###
    shells = {
      fish.enable = false;
      zsh.enable = false;
    };

    ### Window-Manager ###
    wm = {
      niri.enable = false;
    };
  };
  ### PRINTER DRIVERS ###
  # If needed add additional printer drivers here
  services.printing.drivers = [ ];

  ### specify shells for every user ###
  users.users.<username>.shell = pkgs.<shell>; # e.g. pkgs.fish

  # SET TO THE SYSTEM VERSION YOU INSTALL WITH THE ISO, DO NOT TOUCH AFTER
  system.stateVersion = "26.05";
}
