{ config, lib, ... }:

{
  options = {
    systemSettings.powerProfiles = {
      enable = lib.mkEnableOption "Enable Power-Profiles-Daemon";
    };
  };

  config = lib.mkIf (config.systemSettings.powerProfiles.enable) {
    services.power-profiles-daemon.enable = true;
  };
}
