{ config, pkgs, lib, ... }:

let
  	availableDrivers = [ "amd" "nvidia" ];

  	userSelect = config.systemSettings.graphics;
in
{
  	options.systemSettings.graphics = lib.mkOption {
    		description = "Graphics driver to install (amd or nvidia).";
    		type = lib.types.nullOr (lib.types.enum availableDrivers);
    		default = null;
    		example = "nvidia";
  	};
	
  	config = lib.mkIf (userSelect != null) (lib.mkMerge [
		# AMD
    		(lib.mkIf (userSelect == "amd") {
      			hardware.graphics.enable = true;
      			hardware.graphics.enable32Bit = true;
    		})

    		# NVIDIA
    		(lib.mkIf (userSelect == "nvidia") {
      			boot.initrd.kernelModules = [ "nvidia" ];
      			boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

      			hardware.graphics.enable = true;
			hardware.graphics.enable32Bit = true;

      			services.xserver.videoDrivers = [ "nvidia" ];

      			hardware.nvidia = {
        			open = true;
        			nvidiaSettings = true;
        			modesetting.enable = true;
      			};
			
			hardware.graphics.extraPackages = with pkgs; [
				vulkan-loader
				vulkan-validation-layers
			];
    		})
		{
			# Vulkan
			environment.systemPackages = with pkgs; [
				vulkan-tools
			];
		}
  	]);
}
