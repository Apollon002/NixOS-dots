# Imports all window manager configs
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let

  cfg = config.userSettings.wmConfig.niri;
in
{
  options.userSettings.wmConfig.niri.enable = lib.mkEnableOption "Enable user settings for niri";
  # Import submodules
  imports = [
    inputs.niri-flake.homeModules.niri

    # General settings
    ./general/autostart.nix
    ./general/environment.nix
    ./general/input.nix
    ./general/keymaps.nix
    ./general/misc.nix
    ./general/outputs.nix
    ./general/switch-events.nix
    ./general/workspaces.nix

    # Styling

    # Windowrules
  ];

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
    programs.niri.package = pkgs.niri;
  };
}
