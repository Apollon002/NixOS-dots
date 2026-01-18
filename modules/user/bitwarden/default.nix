{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.bitwarden;
in
{
  options.userSettings.bitwarden.enable = lib.mkEnableOption "Enable Bitwarden Password-Manager";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
  };
}
