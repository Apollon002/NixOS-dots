{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.systemSettings.admin.btop;
in
{
  options.systemSettings.admin.btop.enable = lib.mkEnableOption "Enable btop system monitor";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };
}
