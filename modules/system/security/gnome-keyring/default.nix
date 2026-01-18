{ config, lib, ... }:

{
	options.systemSettings.gkr.enable = 
		lib.mkEnableOption "Enable Gnome-Keyring";

	config = lib.mkIf ( config.systemSettings.gkr.enable ) {
		services.gnome.gnome-keyring.enable = true;
	};
}
