{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.systemSettings.appImage;
in
{
  options.systemSettings.appImage.enable = lib.mkEnableOption "Enable appimages with appimage-run";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      appimage-run
    ];
  };
}
