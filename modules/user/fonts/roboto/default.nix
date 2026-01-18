{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.fonts.roboto;
in
{
  options.userSettings.fonts.roboto.enable = lib.mkEnableOption "Enable Roboto Font";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      roboto
    ];
  };
}
