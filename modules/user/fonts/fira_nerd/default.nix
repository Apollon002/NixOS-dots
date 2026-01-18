{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.fonts.firaNerd;
in
{
  options.userSettings.fonts.firaNerd.enable = lib.mkEnableOption "Enable FiraCode Nerd Font";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      nerd-fonts.fira-code
    ];
  };
}
