{ config, lib, ... }:
{
  config = lib.mkIf (config.systemSettings.bootloader == "systemdboot") {
    boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
  };
}
