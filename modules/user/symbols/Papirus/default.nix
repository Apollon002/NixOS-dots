{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.icons.papirus;
in
{
  options.userSettings.icons.papirus.enable = lib.mkEnableOption "Enable Papirus Icons";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      papirus-papirus-icon-theme
    ];
  };
}
