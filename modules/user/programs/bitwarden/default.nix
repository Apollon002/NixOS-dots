{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.bitwarden;
in
{
  options.userSettings.programs.bitwarden.enable =
    lib.mkEnableOption "Enable Bitwarden Password-Manager";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
  };
}
