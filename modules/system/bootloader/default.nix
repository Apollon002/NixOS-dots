{ config, pkgs, lib, ... }:
let
  	availableBootloaders = [ "grub" "systemdboot" ];
  	userSelect = config.systemSettings.bootloader;
in
{
  	options.systemSettings.bootloader = lib.mkOption {
    		description = "Bootloader to use";
    		type = lib.types.enum availableBootloaders;
    		example = "systemdboot";
    		default = "grub";
  	};

  	config = lib.mkMerge [
    	{
      		boot.loader.efi = {
        		efiSysMountPoint = "/boot";
        		canTouchEfiVariables = (userSelect == "systemdboot");
      		};
    	}

    	{ boot.loader.timeout = 5; }

    	(lib.mkIf (userSelect == "grub") {
      		boot.loader.grub = {
        		enable = true;
        		devices = [ "nodev" ];
        		efiSupport = true;
        		useOSProber = true;
        		efiInstallAsRemovable = true;
        		configurationLimit = 5;
      		};
    	})

    	(lib.mkIf (userSelect == "systemdboot") {
      		boot.loader.systemd-boot.enable = true;
		boot.loader.systemd-boot.configurationLimit = 5;
    	})
	];
}
