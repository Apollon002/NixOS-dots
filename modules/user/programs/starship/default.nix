{ config, lib, ... }:
let
  cfg = config.userSettings.programs.starship;
in
{
  options.userSettings.programs.starship.enable = lib.mkEnableOption "Enable starship prompt";

  config = lib.mkIf (cfg.enable) {
    programs.starship.enable = true;
  };

  imports = [ ./theme.nix ];
}
