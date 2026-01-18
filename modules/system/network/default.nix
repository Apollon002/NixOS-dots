{ config, lib, ... }:

{
  options = {
    systemSettings.network = {
      enable = lib.mkOption {
        description = "Enable NetworkManager (iwd backend)";
        type = lib.types.bool;
        default = true;
        example = false;
      };
    };
  };

  config = lib.mkIf (config.systemSettings.network.enable) {
    networking.wireless.iwd.enable = true;

    networking.networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
