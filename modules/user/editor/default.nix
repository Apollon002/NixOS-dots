# Reads enabled editors and imports all editor modules
{ lib, ... }:
let
  availableEditors = [ "zed" ];

  # for importing all submodules
  entries = builtins.readDir ./.;

  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;

in
{
  options.userSettings.editors.enable = lib.mkOption {
    description = "Editors to activate for this user";
    type = lib.types.listOf (lib.types.enum availableEditors);
    default = [ ];
  };

  # Import submodules
  imports = importsFromSubdirs;
}
