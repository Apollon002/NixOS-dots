{
  config,
  inputs,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.ui.awww;
in
{
  options.userSettings.ui.awww.enable = lib.mkEnableOption "Enables awww wallpaper daemon";

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    ];
  };
}
