{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.dev.typst;
in
{
  options.userSettings.dev.typst.enable = lib.mkEnableOption "Install typst";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      typst
    ];
  };
}
