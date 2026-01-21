{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.systemSettings.kernel == "zen") {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
