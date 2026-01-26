{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.editors.lsp.typst;
in
{
  options.userSettings.editors.lsp.typst.enable =
    lib.mkEnableOption "Enable Language Servers for .typ files";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      tinymist
    ];
  };
}
