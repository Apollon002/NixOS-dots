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

    ./general/input.nix
    ./general/keymaps.nix
  ];

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
    programs.niri.package = pkgs.niri;
  };
}
