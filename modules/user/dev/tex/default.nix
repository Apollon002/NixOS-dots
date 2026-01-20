{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.dev.latex;
in
{
  options.userSettings.dev.latex.enable = lib.mkEnableOption "Install Latex (full)";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      texlive.combined.scheme-full
    ];
  };
}
