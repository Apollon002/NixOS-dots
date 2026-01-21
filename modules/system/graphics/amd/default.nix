{ config, lib, ... }:
{
  config = lib.mkIf (config.systemSettings.graphics == "amd") {
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
