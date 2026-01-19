{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.systemSettings.btop.enable = lib.mkEnableOption "Enable btop system monitor" // {
    default = true;
  };

  config = lib.mkIf config.systemSettings.btop.enable {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}
