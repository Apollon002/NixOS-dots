{ lib, ... }:
let
  entries = builtins.readDir ./.;
  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;
in
{
  imports = importsFromSubdirs;

  options.systemSettings.kernel = lib.mkOption {
    description = "Kernel to use";
    type = lib.types.enum [
      "linux"
      "zen"
    ];
    default = "linux";
    example = "zen";
  };
}
