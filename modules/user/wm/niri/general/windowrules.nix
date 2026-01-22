{
  programs.niri.settings.window-rules = [
    # Styling
    {
      draw-border-with-background = false;
    }
    {
      geometry-corner-radius = {
        top-left = 6.0;
        top-right = 6.0;
        bottom-left = 6.0;
        bottom-right = 6.0;
      };
      clip-to-geometry = true;
    }

    # Programs on specific workspaces
    # Gaming
    {
      matches = [
        { app-id = "steam"; }
      ];
      open-on-workspace = "gaming";
    }
    {
      matches = [
        { app-id = "heroic"; }
      ];
      open-on-workspace = "gaming";
    }
    {
      matches = [
        { app-id = "org.prismlauncher.PrismLauncher"; }
      ];
      open-on-workspace = "gaming";
    }
    # Chat
    {
      matches = [
        { app-id = "thunderbird"; }
      ];
      open-on-workspace = "chat";
    }
    {
      matches = [
        { app-id = "teams-for-linux"; }
      ];
      open-on-workspace = "chat";
    }
    {
      matches = [
        { app-id = "vesktop"; }
      ];
      open-on-workspace = "chat";
    }
    # Web
    {
      matches = [
        { app-id = "librewolf"; }
      ];
      open-on-workspace = "web";
    }
    {
      matches = [
        { app-id = "Spotify"; }
      ];
      open-on-workspace = "music";
    }

    # Floating windows
    {
      matches = [
        { app-id = "nemo"; }
      ];
      open-floating = true;
      default-window-height = {
        fixed = 800;
      };
      default-column-width = {
        fixed = 1135;
      };
    }

    # Block from screenshare
    {
      matches = [
        { app-id = "Bitwarden"; }
      ];
      block-out-from = "screen-capture";
    }
    {
      matches = [
        { app-id = "Bitwarden"; }
      ];
      block-out-from = "screencast";
    }
  ];
}
