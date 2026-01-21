{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.programs.microfetch;
in
{
  options.userSettings.programs.microfetch.enable =
    lib.mkEnableOption "Enable microfetch, a really fast fetch tool";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      microfetch
    ];
  };
}
