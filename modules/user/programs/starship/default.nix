{ config, lib, ... }:
let
  cfg = config.userSettings.starship;
in
{
  options.userSettings.starship.enable = lib.mkEnableOption "Enable starship prompt";

  config = lib.mkIf (cfg.enable) {
    programs.starship.enable = true;
  };

  imports = [ ./theme.nix ];
}
