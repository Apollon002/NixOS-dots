{ config, lib, ... }:
let
  isEnabled = builtins.elem "niri" (config.userSettings.wm.enable or [ ]);
in
{
  xdg.configFile = lib.mkIf isEnabled {
    # Alle Dateien/Ordner aus repo/config/niri nach ~/.config/niri/
    "niri".source = ./config;
    "niri".recursive = true;
  };
}
