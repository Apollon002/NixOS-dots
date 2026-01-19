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

  config = lib.mkIf config.systemSettings.dgop.enable {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}
