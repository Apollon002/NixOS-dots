{
  config,
  pkgs,
  lib,
}:
let
  cfg = config.userSettings.ui.pywalfox;
in
{
  options.userSettings.ui.pywalfox.enable =
    lib.mkEnableOption "Enable pywalfox for Firefox/Thunderbird theming";

  config = lib.mkIf (cfg.enable) {
    home-packages = with pkgs; [
      pywalfox-native
    ];
  };
}
