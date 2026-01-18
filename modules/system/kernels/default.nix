{
  config,
  pkgs,
  lib,
  ...
}:

let
  availableKernels = [
    "linux"
    "zen"
  ];
  userSelect = config.systemSettings.kernel;
in
{
  options.systemSettings.kernel = lib.mkOption {
    description = "Kernel to use";
    type = lib.types.enum availableKernels;
    example = "zen";
    default = "linux";
  };

  config = {
    boot.kernelPackages = if userSelect == "zen" then pkgs.linuxPackages_zen else pkgs.linuxPackages;
  };
}
