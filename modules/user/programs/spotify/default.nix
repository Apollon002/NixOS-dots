{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.spotify;
in
{
  options.userSettings.spotify.enable = lib.mkEnableOption "Enable spotify";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
