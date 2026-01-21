{ config, lib, ... }:
let
  cfg = config.systemSettings.shells.fish;
in
{
  options.systemSettings.shells.fish.enable = lib.mkEnableOption "Enable fish shell";

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        					set fish_greeting
        				'';
    };
    documentation.man.generateCaches = false; # To fix long build times
  };
}
