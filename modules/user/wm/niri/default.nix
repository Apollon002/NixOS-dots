{ config, lib, ... }:
let
  isEnabled = builtins.elem "niri" (config.userSettings.wm.enable or [ ]);
  dmsEnabled = config.ui.dms.enable;
  path = if dmsEnabled then "niri/dms" else "niri";
in
{
  xdg.configFile = lib.mkIf (isEnabled && !dmsEnabled) {
    # Alle Dateien/Ordner aus repo/config/niri nach ~/.config/niri/
    "niri".source = ./config;
    "niri".target = path;
    "niri".recursive = true;
  };
}
