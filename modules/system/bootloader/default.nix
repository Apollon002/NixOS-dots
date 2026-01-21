{ lib, ... }:
let
  entries = builtins.readDir ./.;

  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;
in
{
  options.systemSettings.bootloader = lib.mkOption {
    description = "Bootloader to use";
    type = lib.types.enum [
      "grub"
      "systemdboot"
    ];
    default = "grub";
    example = "systemdboot";
  };

  config = {
    boot.loader.efi.efiSysMountPoint = "/boot";
    boot.loader.timeout = 5;

  };

  imports = importsFromSubdirs;
}
