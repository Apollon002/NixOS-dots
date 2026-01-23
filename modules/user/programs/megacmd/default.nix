{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.userSettings.programs.megacmd;
  megaPkgs = inputs.nixpkgs-megacmd.legacyPackages.${pkgs.system};
in
{
  options.userSettings.programs.megacmd = {
    enable = lib.mkEnableOption "Enable MEGA-CMD, a CLI tool to sync your MEGA files to a local machine";
    autostart = lib.mkEnableOption "Autostart MEGA-CMD-server when starting a user session";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      megaPkgs.megacmd-bin
    ];
    systemd.user.services.mega-cmd-server = lib.mkIf cfg.autostart {
      Unit = {
        Description = "MEGA CMD Server (user)";
        After = [ "network-online.target" ];
        Wants = [ "network-online.target" ];
      };

      Service = {
        Type = "simple";
        ExecStart = "${megaPkgs.megacmd-bin}/bin/mega-cmd-server";
        Restart = "on-failure";
        RestartSec = 5;
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
