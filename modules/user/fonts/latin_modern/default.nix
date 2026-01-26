{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.fonts.lmodern;
in
{
  options.userSettings.fonts.lmodern.enable =
    lib.mkEnableOption "Enable Latin Mordern Font (TeX default)";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      lmodern
    ];
  };
}
