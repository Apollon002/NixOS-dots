{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.office.teams;
in
{
  options.userSettings.office.teams.enable =
    lib.mkEnableOption "Install Teams-for-Linux (unofficial)";

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      teams-for-linux
    ];
  };
}
