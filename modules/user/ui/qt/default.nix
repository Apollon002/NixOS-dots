{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.ui.qt;
in
{
  options.userSettings.ui.qt.enable = lib.mkEnableOption "Enable Qt settings";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      qt6ct
      libsForQt5.qt5ct
    ];

    qt = {
      enable = true;
      platformTheme.name = "qtct";
      style.name = "adwaita-dark";
    };
  };
}
