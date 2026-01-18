{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.symbols.bibataCursor;
in
{
  options.userSettings.symbols.bibataCursor.enable = lib.mkEnableOption "Enable Bibata Cursors";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      bibata-cursors
    ];
  };
}
