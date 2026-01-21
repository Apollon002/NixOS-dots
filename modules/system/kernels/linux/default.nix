{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.systemSettings.kernel == "linux") {
    boot.kernelPackages = pkgs.linuxPackages;
  };
}
