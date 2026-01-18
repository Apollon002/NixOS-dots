{ config, pkgs, lib, ... }:

{
	options.systemSettings.kdePolkit.enable = 
		lib.mkEnableOption "Enable KDE Polkit Agent";

	config = lib.mkIf ( config.systemSettings.kdePolkit.enable ) {
	
		security.polkit.enable = true;
		  
		environment.systemPackages = with pkgs; [
			kdePackages.polkit-kde-agent-1
		];

		systemd.user.services.polkit-kde-authentication-agent = {
			description = "KDE Polkit Authentication Agent";
			wantedBy = [ "graphical-session.target" ];
			after = [ "graphical-session.target" ];
			serviceConfig = {
				Type = "simple";
				ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
				Restart = "on-failure";
				RestartSec = "1s";
			};
		};
	};
}
