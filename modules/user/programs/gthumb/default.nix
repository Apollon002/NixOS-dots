{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.gthumb;
in
{
  options.userSettings.programs.gthumb.enable =
    lib.mkEnableOption "Enable gthumb, a GTK image viewer with basic utilities";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gthumb
    ];
  };
}
