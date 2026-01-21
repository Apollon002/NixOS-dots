{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.amberol;
in
{
  options.userSettings.programs.amberol.enable =
    lib.mkEnableOption "Install amberol, a simple GTK audio player";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      amberol
    ];
  };
}
