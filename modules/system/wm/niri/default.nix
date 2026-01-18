{ config, pkgs, lib, ... }:

{
	options.systemSettings.niri.enable = 
		lib.mkEnableOption "Enable niri wm";

	config = lib.mkIf ( config.systemSettings.niri.enable ) {
		programs.niri.enable = true;
		# Dependencies
		environment.systemPackages = with pkgs; [
			wl-clipboard
			cliphist
			# Support for x11 Apps
			xwayland-satellite
		];
		
		# Portals
		xdg.portal.enable = true;
		xdg.portal.extraPortals = with pkgs; [
			xdg-desktop-portal-gnome
			xdg-desktop-portal-gtk # Fallback
		];
		
		xdg.portal.config.common = {
  			default = [ "gnome" "gtk" ];
  			"org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
  			"org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
		};
	};
}
