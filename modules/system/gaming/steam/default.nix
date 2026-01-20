{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.systemSettings.gaming.steam;
in
{
  options.systemSettings.gaming.steam.enable = lib.mkEnableOption "Install steam on the machine";

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    # Additional tools
    environment.systemPackages = with pkgs; [
      mangohud # Performance monitoring
    ];
  };
}
