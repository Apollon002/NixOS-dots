{ config, lib, pkgs, ... }:

{
  	options.systemSettings.dgop.enable =
    		lib.mkEnableOption "Enable dgop system monitor" // {
      		default = true;
    	};

 	 config = lib.mkIf config.systemSettings.dgop.enable {
    		environment.systemPackages = with pkgs; [
      			dgop
    		];
  	};
}
