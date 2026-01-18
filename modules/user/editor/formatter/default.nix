# Reads and enables all formatters
{ ... }:
let
  # for importing all submodules
  entries = builtins.readDir ./.;

  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;
in
{
  # Import submodules
  imports = importsFromSubdirs;
}
