{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.systemSettings.graphics;

  entries = builtins.readDir ./.;
  subdirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

  importsFromSubdirs = map (name: ./. + "/${name}/default.nix") subdirs;
in
{
  options.systemSettings.graphics = lib.mkOption {
    description = "Graphics driver to install (amd or nvidia).";
    type = lib.types.nullOr (
      lib.types.enum [
        "amd"
        "nvidia"
      ]
    );
    default = null;
    example = "nvidia";
  };

  config = lib.mkIf (cfg != null) {
    # Vulkan tools (common)
    environment.systemPackages = with pkgs; [
      vulkan-tools
    ];
  };

  imports = importsFromSubdirs;
}
