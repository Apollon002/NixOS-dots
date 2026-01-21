{ config, lib, ... }:
let
  cfg = config.systemSettings.printing.sane;
in
{
  options.systemSettings.printing.sane.enable =
    lib.mkEnableOption "Enable SANE for scanning via printer";

  config = lib.mkIf cfg.enable {
    hardware.sane.enable = true;
  };
}
