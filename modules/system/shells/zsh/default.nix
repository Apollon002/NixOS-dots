{ config, lib, ... }:
let
  cfg = config.systemSettings.shells.zsh;
in
{
  options.systemSettings.shells.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
  };
}
