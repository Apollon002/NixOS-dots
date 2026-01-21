{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.systemSettings.admin.neovim.enable;
in
{
  options.systemSettings.admin.neovim.enable = lib.mkEnableOption "Enable neovim" // {
    default = true;
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];
  };
}
