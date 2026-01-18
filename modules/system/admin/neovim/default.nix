{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.systemSettings.neovim.enable = lib.mkEnableOption "Enable neovim" // {
    default = true;
  };

  config = lib.mkIf config.systemSettings.neovim.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];
  };
}
