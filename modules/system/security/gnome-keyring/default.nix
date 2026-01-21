{ config, lib, ... }:
let
  cfg = config.systemSettings.security.gkr;
in
{
  options.systemSettings.security.gkr.enable = lib.mkEnableOption "Enable Gnome-Keyring";

  config = lib.mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;
  };
}
