{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.icons.bibataCursor;
in
{
  options.userSettings.icons.bibataCursor.enable = lib.mkEnableOption "Enable Bibata Cursors";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      bibata-cursors
    ];
  };
}
