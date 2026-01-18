# Reads enabled browsers and imports all browser modules
{ lib, ... }:
let
  availableBrowsers = [ "librewolf" ];

  # for importing all submodules
  entries = builtins.readDir ./.;

  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;

in
{
  options.userSettings.browsers.enable = lib.mkOption {
    description = "Browsers to activate for this user";
    type = lib.types.listOf (lib.types.enum availableBrowsers);
    default = [ ];
  };

  # Import submodules
  imports = importsFromSubdirs;
}
