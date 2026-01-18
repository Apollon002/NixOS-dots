# from https://github.com/librephoenix/nixos-config/blob/main/
{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  config = {
    services.journald.extraConfig = "SystemMaxUse=50M\nSystemMaxFiles=5";
    services.journald.rateLimitBurst = 500;
    services.journald.rateLimitInterval = "30s";

    time.timeZone = "Europe/Berlin";
    services.timesyncd.enable = true;

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
    i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];

    boot.kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    boot.initrd.systemd.enable = true;
    boot.initrd.verbose = false;
    boot.plymouth.enable = true;

    programs.nano.enable = lib.mkForce false;

    console = {
      font = "Lat2-Terminus16";
      keyMap = "de";
    };

    # Automated garbage collection & flake activation
    nix = {
      settings = {

        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [ "@wheel" ];
        auto-optimise-store = true;
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };

    environment.systemPackages = with pkgs; [
      curl
      git
      wget
      tree
      tldr
      sl
      # Home-Manager
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
    ];
  };
}
