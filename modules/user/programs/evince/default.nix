{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.evince;
in
{
  options.userSettings.programs.evince.enable =
    lib.mkEnableOption "Enable evince, GNOMES's pdf reader";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      evince
    ];
  };
}
