{ host, ... }:

let
  outputsByHost = {
    silvermoon = {
      "DP-1" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 164.999;
        };
        scale = 1.0;
        position = {
          x = 1920;
          y = 0;
        };
        variable-refresh-rate = "on-demand";
        focus-at-startup = true;
      };
      "DP-2" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 144.001;
        };
        scale = 1.0;
        position = {
          x = 0;
          y = 150;
        };
      };
    };

    # Put more configs here
  };
in
{
  programs.niri.settings.outputs = outputsByHost.${host} or { };
}
