{ config, lib, ... }:
let
  cfg = config.userSettings.terminals.kitty;
  dmsEnabled = config.userSettings.ui.dms.enable;
in
{
  options.userSettings.terminals.kitty.enable = lib.mkEnableOption "Enable kitty terminal";

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      font = {
        name = "FiraCode Nerd Font";
        size = 12;
        package = null;
      };

      shellIntegration.enableFishIntegration = true;

      settings = {
        background_opacity = 0.8;
        background = "black";
      };
      extraConfig =
        if dmsEnabled then
          ''
            include dank-tabs.conf
            include dank-theme.conf
          ''

        else
          "";
    };
  };
}
