{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.editors.lsp.nix;
in
{
  options.userSettings.editors.lsp.nix.enable =
    lib.mkEnableOption "Enable Language Servers for .nix files";

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      nil
      nixd
    ];
  };
}
