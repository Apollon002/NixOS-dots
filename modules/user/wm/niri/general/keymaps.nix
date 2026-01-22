{ config, lib, ... }:
let
  fileBrowser = config.userSettings.fileBrowser;
  dmsEnabled = config.userSettings.ui.dms.enable;
in
{
  programs.niri.settings.binds = lib.mkMerge [
    {
      # Hotkey overlay
      "Mod+Ctrl+Period".action.show-hotkey-overlay = { };

      # Clients
      "Mod+Return".action.spawn = [ "kitty" ];
      "Mod+B".action.spawn = [ "librewolf" ];

      # Session management
      "Mod+Shift+M".action.quit = { };
      "Mod+Shift+P".action.power-off-monitors = { };

      # Window management
      "Mod+Tab" = {
        repeat = false;
        action.toggle-overview = { };
      };
      "Mod+Q" = {
        repeat = false;
        action.close-window = { };
      };

      # Navigation
      "Mod+Left".action.focus-column-left = { };
      "Mod+Down".action.focus-window-down = { };
      "Mod+Up".action.focus-window-up = { };
      "Mod+Right".action.focus-column-right = { };

      # Monitor focus
      "Mod+Shift+Left".action.focus-monitor-left = { };
      "Mod+Shift+Down".action.focus-monitor-down = { };
      "Mod+Shift+Up".action.focus-monitor-up = { };
      "Mod+Shift+Right".action.focus-monitor-right = { };
      "Mod+Shift+H".action.focus-monitor-left = { };
      "Mod+Shift+J".action.focus-monitor-down = { };
      "Mod+Shift+K".action.focus-monitor-up = { };
      "Mod+Shift+L".action.focus-monitor-right = { };

      # Move windows across workspaces
      "Mod+Alt+Up".action.move-column-to-workspace-up = { };
      "Mod+Alt+Down".action.move-column-to-workspace-down = { };

      # Mouse wheel workspace navigation
      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = { };
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = { };
      };
      "Mod+Shift+WheelScrollDown" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-down = { };
      };
      "Mod+Shift+WheelScrollUp" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-up = { };
      };

      # Workspace focus
      "Mod+1".action.focus-workspace = "dev";
      "Mod+2".action.focus-workspace = "gaming";
      "Mod+3".action.focus-workspace = "music";
      "Mod+4".action.focus-workspace = "work";
      "Mod+5".action.focus-workspace = "chat";
      "Mod+6".action.focus-workspace = "web";

      "Mod+Shift+1".action.move-window-to-workspace = "dev";
      "Mod+Shift+2".action.move-window-to-workspace = "gaming";
      "Mod+Shift+3".action.move-window-to-workspace = "music";
      "Mod+Shift+4".action.move-window-to-workspace = "work";
      "Mod+Shift+5".action.move-window-to-workspace = "chat";
      "Mod+Shift+6".action.move-window-to-workspace = "web";

      # Presets
      "Mod+R".action.switch-preset-column-width = { };
      "Mod+Shift+R".action.switch-preset-window-height = { };

      # Fullscreen / maximize
      "Mod+F".action.maximize-column = { };
      "Mod+Shift+F".action.maximize-window-to-edges = { };
      "Mod+Alt+F".action.fullscreen-window = { };

      # Center column
      "Mod+C".action.center-column = { };

      # Floating / tabbed
      "Mod+V".action.toggle-window-floating = { };
      "Mod+W".action.toggle-column-tabbed-display = { };

      # Screenshots
      "Print".action.screenshot = { };
      "Ctrl+Print".action.screenshot-screen = { };
      "Alt+Print".action.screenshot-window = { };

      # Audio
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1+"
          "-l"
          "1.0"
        ];
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1-"
        ];
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SOURCE@"
          "toggle"
        ];
      };

      # Media (MPRIS)
      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn = [
          "playerctl"
          "play-pause"
        ];
      };
      "XF86AudioStop" = {
        allow-when-locked = true;
        action.spawn = [
          "playerctl"
          "stop"
        ];
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn = [
          "playerctl"
          "previous"
        ];
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn = [
          "playerctl"
          "next"
        ];
      };

      # Brightness
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "+5%"
        ];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "5%-"
        ];
      };

      # Keyboard inhibitor escape hatch
      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = { };
      };
    }

    (lib.optionalAttrs (fileBrowser == "nemo") {
      "Mod+E".action.spawn = [ "nemo" ];
    })

    (lib.optionalAttrs dmsEnabled {
      "Mod+Space".action.spawn-sh = [ "dms ipc call spotlight toggle" ];
      "Mod+L".action.spawn-sh = [ "dms ipc call lock lock" ];
      "Mod+P".action.spawn-sh = [ "dms ipc call powermenu toggle" ];
    })
  ];
}
