{ config, lib, ... }:
let
  cfg = config.userSettings.programs.thunderbird;
in
{
  options.userSettings.programs.thunderbird.enable =
    lib.mkEnableOption "Enabled thunderbird mail client";

  config = lib.mkIf cfg.enable {
    programs.thunderbird.enable = true;
    programs.thunderbird.profiles = { };
  };
}
