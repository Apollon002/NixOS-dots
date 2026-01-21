{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.systemSettings.admin.neovim;
in
{
  options.systemSettings.admin.neovim.enable = lib.mkEnableOption "Enable neovim";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];
  };
}
