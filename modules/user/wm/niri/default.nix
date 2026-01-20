{ config, lib, ... }:
let
  isEnabled = builtins.elem "niri" (config.userSettings.wm.enable or [ ]);
  dmsEnabled = config.userSettings.ui.dms.enable;
in
{
  xdg.configFile = lib.mkIf isEnabled {
    # Alle Dateien/Ordner aus repo/config/niri nach ~/.config/niri/
    "niri/config.kdl".text =
      builtins.readFile ./config/config.kdl
      + "\n"
      + lib.optionalString dmsEnabled ''include "dms/colors.kdl"'';
    # general config
    "niri/general/autostart.kdl".text = builtins.readFile ./config/general/autostart.kdl;
    "niri/general/input.kdl".text = builtins.readFile ./config/general/input.kdl;
    "niri/general/keymaps.kdl".text =
      builtins.readFile ./config/general/keymaps.kdl
      + "\n"
      + lib.optionalString dmsEnabled ''
        // dms keybinds
        Mod+Space { spawn-sh "dms ipc call spotlight toggle"; }
        Mod+L { spawn-sh "dms ipc call lock lock"; }
      ''
      + "\n"
      + "}";
    "niri/general/misc.kdl".text = builtins.readFile ./config/general/misc.kdl;
    "niri/general/outputs.kdl".text = builtins.readFile ./config/general/outputs.kdl;
    "niri/general/switch-events.kdl".text = builtins.readFile ./config/general/switch-events.kdl;
    "niri/general/workspaces.kdl".text = builtins.readFile ./config/general/workspaces.kdl;
    # styling
    "niri/styling/animations.kdl".text = builtins.readFile ./config/styling/animations.kdl;
    "niri/styling/colors.kdl".text = builtins.readFile ./config/styling/colors.kdl;
    "niri/styling/corners.kdl".text = builtins.readFile ./config/styling/corners.kdl;
    "niri/styling/cursor.kdl".text = builtins.readFile ./config/styling/cursor.kdl;
    "niri/styling/layout.kdl".text = builtins.readFile ./config/styling/layout.kdl;
    # windowrules
    "niri/windowrules/block_screencapture.kdl".text =
      builtins.readFile ./config/windowrules/block_screencapture.kdl;
    "niri/windowrules/spawn_at_workspace.kdl".text =
      builtins.readFile ./config/windowrules/spawn_at_workspace.kdl;

  };
}
