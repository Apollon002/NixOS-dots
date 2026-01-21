{ config, lib, ... }:
let
  cfg = config.systemSettings.network.networkManager;
in
{
  options.systemSettings.network.networkManager.enable =
    lib.mkEnableOption "Enable NetworkManager with iwd backend";

  config = lib.mkIf cfg.enable {
    networking.wireless.iwd.enable = true;
    networking.networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
