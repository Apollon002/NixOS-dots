{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.systemSettings.gaming.heroic;
in
{
  options.systemSettings.gaming.heroic.enable = lib.mkEnableOption "Install heroic laucher";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      heroic
      proton-ge-bin
    ];
  };
}
