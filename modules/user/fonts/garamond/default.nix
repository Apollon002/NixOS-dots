{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.fonts.garamond;
in
{
  options.userSettings.fonts.garamond.enable = lib.mkEnableOption "Enable FiraCode Nerd Font";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      garamond-libre
    ];
  };
}
