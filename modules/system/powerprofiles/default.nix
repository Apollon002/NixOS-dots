{ config, lib, ... }:
let
  cfg = config.systemSettings.powerProfiles;
in
{
  options = {
    systemSettings.powerProfiles.enable = lib.mkEnableOption "Enable Power-Profiles-Daemon";
  };

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = true;
  };
}
