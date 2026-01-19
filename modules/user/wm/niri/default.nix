{ config, lib, ... }:
let
  isEnabled = builtins.elem "niri" (config.userSettings.wm.enable or [ ]);
  dmsEnabled = config.userSettings.ui.dms.enable;
in
{
  xdg.configFile = lib.mkIf isEnabled {
    # Alle Dateien/Ordner aus repo/config/niri nach ~/.config/niri/
    "niri".source = ./config;
    "niri".recursive = true;

    "niri/config.kdl".text =
      builtins.readFile ./config.kdl + "\n" + lib.optionalString dmsEnabled ''include "dms/colors.kdl"'';
  };
}
