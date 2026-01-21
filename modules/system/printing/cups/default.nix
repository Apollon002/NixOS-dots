{ config, lib, ... }:
let
  cfg = config.systemSettings.printing.cups;
in
{
  options.systemSettings.printing.cups.enable = lib.mkEnableOption "Enable cups, a printing daemon";

  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
    # Discover printers in network automatically
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
