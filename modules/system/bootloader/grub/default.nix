{ config, lib, ... }:
{
  config = lib.mkIf (config.systemSettings.bootloader == "grub") {
    boot.loader.efi.canTouchEfiVariables = false; # because we use install as removable

    boot.loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      efiInstallAsRemovable = true;
      configurationLimit = 5;
    };
  };
}
