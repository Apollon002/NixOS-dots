{ config, lib, ... }:
let
  cfg = config.userSettings.kitty;
in
{
  options.userSettings.kitty.enable = lib.mkEnableOption "Enable kitty terminal";

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
        background_opacity = 0.85;
        background = "black";
      };
    };
  };
}
