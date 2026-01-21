{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.systemSettings.graphics == "nvidia") {
    boot.initrd.kernelModules = [ "nvidia" ];
    boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
    };

    hardware.graphics.extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
    ];
  };
}
