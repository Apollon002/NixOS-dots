{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.onlyOffice;
in
{
  options.userSettings.onlyoffice.enable = lib.mkEnableOption "Install Only-Office";

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      onlyoffice-desktopeditors
      corefonts # microsoft core fonts (Arial, Times New Roman, etc.)
    ];
  };
}
