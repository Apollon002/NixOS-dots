# Imports all file browser options (only one can be active at a time)
{ lib, ... }:
let
  entries = builtins.readDir ./.;

  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;
in
{
  options.userSettings.fileBrowser = lib.mkOption {
    description = "File browser to use";
    type = lib.types.enum [
      "nemo"
    ];
    default = "nemo";
    example = "nemo";
  };

  imports = importsFromSubdirs;
}
