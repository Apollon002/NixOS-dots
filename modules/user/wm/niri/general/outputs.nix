{ host, ... }:

let
  outputsByHost = {
    silvermoon = {
      "ASUSTek COMPUTER INC VG27A R7LMQS113801" = {
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
      "LG Electronics 24GM79G 0x0008040D" = {
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
