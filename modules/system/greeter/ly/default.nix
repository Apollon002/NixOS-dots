{ config, lib, ... }:
{
  	config = lib.mkIf (config.systemSettings.greeter == "ly") {
    		services.displayManager.ly.enable = true;
  	};
}
