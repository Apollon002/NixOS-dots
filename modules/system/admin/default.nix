# Imports all system administration tools
args@{ ... }:
let
  entries = builtins.readDir ./.;

  subdirs =
    builtins.filter
      (name: entries.${name} == "directory")
      (builtins.attrNames entries);

  importsFromSubdirs =
    map
      (name: ./. + "/${name}/default.nix")
      subdirs;
in
{
  imports = importsFromSubdirs;
}
