{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cfg = config.userSettings.ui.dms;
in
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  options.userSettings.ui.dms.enable = lib.mkEnableOption "Enable DankMaterialShell";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      matugen
      i2c-tools
      cava
    ];
    programs.dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      # Features
      enableDynamicTheming = true;
    };
  };
}
