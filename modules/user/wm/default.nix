# Reads enabled browsers and imports all browser modules
{ config, lib, ... }:
let
	availableWM = [ "niri" ];

	# for importing all submodules
	entries = builtins.readDir ./.;

	subdirs  = builtins.filter 
	(name: entries.${name} == "directory")
	(builtins.attrNames entries);

	importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;

in
{
	options.userSettings.wm.enable = lib.mkOption {
		description = "Window Manager settings to activate for this user";
		type = lib.types.listOf (lib.types.enum availableWM);
		default = [];
	};
	
	# Import submodules
	imports = importsFromSubdirs;
}


