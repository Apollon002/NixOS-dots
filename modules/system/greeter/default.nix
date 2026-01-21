# Imports all greeter options (only one can be active at a time)
{ lib, ... }:
let
  entries = builtins.readDir ./.;

  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;
in
{
  options.systemSettings.greeter = lib.mkOption {
    description = "Display-Manager to use";
    type = lib.types.nullOr (
      lib.types.enum [
        "ly"
        "dankGreet"
      ]
    );
    default = null;
    example = "dankGreet";
  };

  imports = importsFromSubdirs;
}
