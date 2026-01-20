{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.systemSettings.gaming.minecraft;
in
{
  options.systemSettings.gaming.minecraft.enable =
    lib.mkEnableOption "Install Minecraft (Prism launcher)";

  config = lib.mfIf cfg.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      jdk21
    ];
  };
}
