{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.vesktop;
in
{
  options.userSettings.vesktop.enable = lib.mkEnableOption "Enable vesktop (Discord client)";

  config = lib.mkIf (cfg.enable) {
    programs.vesktop.enable = true;
    programs.vesktop.vencord.settings.enabledThemes = [ "dank-discord.css" ];
  };
}
