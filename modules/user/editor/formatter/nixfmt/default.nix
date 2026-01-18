{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.editors.formatter.nix;
in
{
  options.userSettings.editors.formatter.nix.enable =
    lib.mkEnableOption "Enable formatter for .nix files";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      nixfmt
    ];
  };
}
