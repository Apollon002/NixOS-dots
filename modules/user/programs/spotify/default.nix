{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.spotify;
in
{
  options.userSettings.programs.spotify.enable = lib.mkEnableOption "Enable spotify";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
