{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.ui.gtk;
in
{
  options.userSettings.ui.gtk.enable = lib.mkEnableOption "Enable GTK settings";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      # Theme
      adw-gtk3
    ];

    gtk = {
      enable = true;

      theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };
    };
  };
}
