{ lib, ... }:
{
  programs.niri.settings.layout = lib.mkMerge [
    # Verhalten/Geometrie
    {
      gaps = 16;

      center-focused-column = "never";
      always-center-single-column = true;
      empty-workspace-above-first = true;

      default-column-display = "tabbed";

      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.8; }
      ];

      default-column-width = {
        proportion = 0.5;
      };

      preset-window-heights = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];

      focus-ring = {
        enable = false;
        width = 3;
      };

      border = {
        enable = false;
        width = 3;
      };

      shadow = {
        # enable nicht gesetzt (bei dir war // on auskommentiert)
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        draw-behind-window = true;
      };

      tab-indicator = {
        # enable nicht gesetzt (bei dir war // off auskommentiert)
        hide-when-single-tab = true;
        place-within-column = true;
        gap = 5;
        width = 4;
        length.total-proportion = 1.0;
        position = "right";
        gaps-between-tabs = 2;
        corner-radius = 8;
      };

      insert-hint = { };
      struts = { };
    }

    # Styling/Farben
    {
      background-color = "black";

      focus-ring = {
        # active-gradient from="#d6afff" to="#5e5ad8" angle=135
        active.gradient = {
          from = "#d6afff";
          to = "#5e5ad8";
          angle = 135;
        };

        inactive.color = "#505050";
        urgent.color = "#9b0000";
      };

      border = {
        active.gradient = {
          from = "#d6afff";
          to = "#5e5ad8";
          angle = 135;
        };

        inactive.color = "#505050";
        urgent.color = "#9b0000";
      };

      shadow.color = "#00000070";

      tab-indicator = {
        active.color = "#d6afff";
        inactive.color = "gray";
        urgent.color = "red";
      };

      # WICHTIG: insert-hint nutzt "display" (Decoration), nicht "color"
      insert-hint.display.color = "#ffc87f80";
      # alternativ als gradient:
      # insert-hint.display.gradient = { from = "..."; to = "..."; angle = 45; relative-to = "workspace-view"; };
    }
  ];
}
