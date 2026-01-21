{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.simpleScan;
in
{
  options.userSettings.programs.simpleScan.enable =
    lib.mkEnableOption "Install simple-scan, GNOME's scanner app";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      simple-scan
    ];
  };
}
