# Imports all window manager configs
{
  config,
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
  imports = lib.optionals cfg.enable [
    inputs.niri-flake.homeModules.niri

    ./general/keymaps.nix
  ];

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
