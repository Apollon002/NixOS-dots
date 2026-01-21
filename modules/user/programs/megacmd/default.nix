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
  options.userSettings.programs.megacmd.enable =
    lib.mkEnableOption "Enables MEGACmd, a CLI MEGA Cloud service manager";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      megacmd
    ];
  };
}
