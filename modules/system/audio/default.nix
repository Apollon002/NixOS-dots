{ config, lib, ...}:

{
	options = {
		systemSettings.pipewire = {
			enable = lib.mkOption {
				description = "Enable Pipewire";
				type = lib.types.bool;
				default = true;
				example = false;
			};
		};
	};

	config = lib.mkIf ( config.systemSettings.pipewire.enable ) {
  		
		security.rtkit.enable = true; # give pipewire realtime priority
  		services.pipewire = {
    			enable = true;
    			alsa.enable = true;
    			alsa.support32Bit = true;
    			jack.enable = true;
    			pulse.enable = true;
		};
	};
}
