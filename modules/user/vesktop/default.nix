{
  config,
  pkgs,
  lib,
}:
let
  cfg = config.userSettings.vesktop;
in
{
  options.userSettings.vesktop.enable = lib.mkOption "Enable vesktop (Discord client)";

  config = (cfg.enable) {
    home.packages = with pkgs; [
      vesktop
    ];
  };
}
