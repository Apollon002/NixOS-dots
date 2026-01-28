{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.systemSettings.gaming.faugus;
in
{
  options.systemSettings.gaming.faugus.enable = lib.mkEnableOption "Install faugus laucher";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      faugus-launcher
    ];
  };
}
