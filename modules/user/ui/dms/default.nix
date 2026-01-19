{
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.userSettings.ui.dms;
in
{
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  options.userSettings.ui.dms.enable = lib.mkEnableOption "Enable DankMaterialShell";

  config = lib.mkIf (cfg.enable) {
    # programs.dank-material-shell.enable = true;
  };
}
