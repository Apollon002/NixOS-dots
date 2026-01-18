{ config, lib, ... }:
let
  cfg = config.userSettings.shell.fish;
in
{
  options.userSettings.shell.fish.enable = lib.mkEnableOption "Enables Fish user configuration";

  config = lib.mkIf (cfg.enable) {

    programs.fish = {
      enable = true;

      shellInit = ''
        				set fish_greeting
        				starship init fish | source
        				export SSH_AUTH_SOCK=/home/jannik/.bitwarden-ssh-agent.sock
        			'';
    };
  };
}
