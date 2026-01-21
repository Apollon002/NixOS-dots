{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.megacmd;
in
{
  options.userSettings.programs.megacmd = {
    enable = lib.mkEnableOption "Enables MEGACmd, a CLI MEGA Cloud service manager";
    autostart = lib.mkEnableOption "Creates a systemd user unit to autostart megacmd" // {
      default = false;
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      megacmd
    ];
    systemd.user.services.mega-cmd-service = lib.mkIf cfg.autostart {
      Unit = {
        Description = "Service that starts MegaCMD with user login";
        After = [ "network-online.target" ];
        Wants = [ "network-online.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.megacmd}/bin/mega-cmd-server";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
