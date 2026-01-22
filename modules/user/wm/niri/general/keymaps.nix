{ ... }:
{
  programs.niri.settings.binds = [
    # Hotkey overlay
    {
      action = "show-hotkey-overlay";
      key = "Mod+Ctrl+Period";
    }

    # Clients
    {
      action = "spawn";
      key = "Mod+Return"; # falls du MOD vs Mod vereinheitlichen willst: überall "Mod"
      "hotkey-overlay-title" = "Open a Terminal: kitty";
      command = [ "kitty" ];
    }
    {
      action = "spawn";
      key = "Mod+B";
      "hotkey-overlay-title" = "Open Browser: librewolf";
      command = [ "librewolf" ];
    }

    # Session management
    # { key = "Mod+L"; action = "..."; } # TO BE IMPLEMENTED
    {
      key = "Mod+Shift+M";
      action = "quit";
    }
    {
      key = "Mod+Shift+P";
      action = "power-off-monitors";
    }

    # Window management
    {
      key = "Mod+Tab";
      action = "toggle-overview";
      repeat = false;
    }
    {
      key = "Mod+Q";
      action = "close-window";
      repeat = false;
    }

    # Navigation
    {
      key = "Mod+Left";
      action = "focus-column-left";
    }
    {
      key = "Mod+Down";
      action = "focus-window-down";
    }
    {
      key = "Mod+Up";
      action = "focus-window-up";
    }
    {
      key = "Mod+Right";
      action = "focus-column-right";
    }

    # Switch focus between monitors
    {
      key = "Mod+Shift+Left";
      action = "focus-monitor-left";
    }
    {
      key = "Mod+Shift+Down";
      action = "focus-monitor-down";
    }
    {
      key = "Mod+Shift+Up";
      action = "focus-monitor-up";
    }
    {
      key = "Mod+Shift+Right";
      action = "focus-monitor-right";
    }
    {
      key = "Mod+Shift+H";
      action = "focus-monitor-left";
    }
    {
      key = "Mod+Shift+J";
      action = "focus-monitor-down";
    }
    {
      key = "Mod+Shift+K";
      action = "focus-monitor-up";
    }
    {
      key = "Mod+Shift+L";
      action = "focus-monitor-right";
    }

    # Move windows across workspaces
    {
      key = "Mod+Alt+Up";
      action = "move-column-to-workspace-up";
    }
    {
      key = "Mod+Alt+Down";
      action = "move-column-to-workspace-down";
    }

    # Mouse wheel gestures for navigation
    {
      key = "Mod+WheelScrollDown";
      action = "focus-workspace-down";
      "cooldown-ms" = 150;
    }
    {
      key = "Mod+WheelScrollUp";
      action = "focus-workspace-up";
      "cooldown-ms" = 150;
    }
    {
      key = "Mod+Shift+WheelScrollDown";
      action = "move-column-to-workspace-down";
      "cooldown-ms" = 150;
    }
    {
      key = "Mod+Shift+WheelScrollUp";
      action = "move-column-to-workspace-up";
      "cooldown-ms" = 150;
    }

    # Workspace navigation (named)
    {
      key = "Mod+1";
      action = "focus-workspace";
      workspace = "work";
    }
    {
      key = "Mod+2";
      action = "focus-workspace";
      workspace = "web";
    }
    {
      key = "Mod+3";
      action = "focus-workspace";
      workspace = "gaming";
    }
    {
      key = "Mod+4";
      action = "focus-workspace";
      workspace = "dev";
    }
    {
      key = "Mod+5";
      action = "focus-workspace";
      workspace = "chat";
    }
    {
      key = "Mod+6";
      action = "focus-workspace";
      workspace = "scratch";
    }

    {
      key = "Mod+Shift+1";
      action = "move-window-to-workspace";
      workspace = "work";
    }
    {
      key = "Mod+Shift+2";
      action = "move-window-to-workspace";
      workspace = "web";
    }
    {
      key = "Mod+Shift+3";
      action = "move-window-to-workspace";
      workspace = "gaming";
    }
    {
      key = "Mod+Shift+4";
      action = "move-window-to-workspace";
      workspace = "dev";
    }
    {
      key = "Mod+Shift+5";
      action = "move-window-to-workspace";
      workspace = "chat";
    }
    {
      key = "Mod+Shift+6";
      action = "move-window-to-workspace";
      workspace = "scratch";
    }

    # Presets
    {
      key = "Mod+R";
      action = "switch-preset-column-width";
    }
    {
      key = "Mod+Shift+R";
      action = "switch-preset-window-height";
    }

    # Full screen settings
    {
      key = "Mod+F";
      action = "maximize-column";
    }
    {
      key = "Mod+Shift+F";
      action = "maximize-window-to-edges";
    }
    {
      key = "Mod+Alt+F";
      action = "fullscreen-window";
    }

    # Center column
    {
      key = "Mod+C";
      action = "center-column";
    }

    # Floating windows
    {
      key = "Mod+V";
      action = "toggle-window-floating";
    }

    # Tabbed column mode
    {
      key = "Mod+W";
      action = "toggle-column-tabbed-display";
    }

    # Screen capture
    {
      key = "Print";
      action = "screenshot";
    }
    {
      key = "Ctrl+Print";
      action = "screenshot-screen";
    }
    {
      key = "Alt+Print";
      action = "screenshot-window";
    }

    # Multimedia (spawn-sh)
    {
      key = "XF86AudioRaiseVolume";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
    }
    {
      key = "XF86AudioLowerVolume";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
    }
    {
      key = "XF86AudioMute";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    }
    {
      key = "XF86AudioMicMute";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    }

    # MPRIS (playerctl)
    {
      key = "XF86AudioPlay";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "playerctl play-pause";
    }
    {
      key = "XF86AudioStop";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "playerctl stop";
    }
    {
      key = "XF86AudioPrev";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "playerctl previous";
    }
    {
      key = "XF86AudioNext";
      action = "spawn-sh";
      "allow-when-locked" = true;
      command = "playerctl next";
    }

    # Brightness
    {
      key = "XF86MonBrightnessUp";
      action = "spawn";
      "allow-when-locked" = true;
      command = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "+5%"
      ];
    }
    {
      key = "XF86MonBrightnessDown";
      action = "spawn";
      "allow-when-locked" = true;
      command = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "5%-"
      ];
    }

    # Inhibitor escape hatch
    {
      key = "Mod+Escape";
      action = "toggle-keyboard-shortcuts-inhibit";
      "allow-inhibiting" = false;
    }
  ];
}
