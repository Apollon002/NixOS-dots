{ config, lib, ... }:
let
  isEnabled = builtins.elem "niri" (config.userSettings.wm.enable or [ ]);
  dmsEnabled = config.userSettings.ui.dms.enable;
  # DankMaterialShell needs a diffrent path for imports
  path = if dmsEnabled then "niri/dms" else "niri";
in
{
  xdg.configFile = lib.mkIf isEnabled {
    # Alle Dateien/Ordner aus repo/config/niri nach ~/.config/niri/
    "niri".source = ./config;
    "niri".target = path;
    "niri".recursive = true;
  };
}
