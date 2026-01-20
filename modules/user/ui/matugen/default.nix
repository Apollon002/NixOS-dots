{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.ui.matugen;
  dmsEnabled = config.userSettings.ui.dms.enable;
in
{
  options.userSettings.ui.matugen.enable = lib.mkEnableOption "Enable Matugen";

  config = lib.mkIf (cfg.enable || dmsEnabled) {
    home.packages = with pkgs; [ matugen ];
    xdg.configFile = lib.mkIf (cfg.enable || dmsEnabled) {
      # matugen config.toml file that reads and places templates
      "matugen/config.toml".text = ''
        [config]

        [templates.mytemplate]
        input_path = '~/.config/matugen/templates/zed-colors.json'
        output_path = '~/.config/zed/themes/matugen.json'
      '';
    };
  };
  # Import themes
  imports = [ ./templates.nix ];
}
