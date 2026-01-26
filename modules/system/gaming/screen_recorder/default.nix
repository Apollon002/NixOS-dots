{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.systemSettings.gaming.screenRecorder;
in
{
  options.systemSettings.gaming.screenRecorder.enable =
    lib.mkEnableOption "Install GPU-Screen-Recorder";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gpu-screen-recorder
      gpu-screen-recorder-gtk
    ];
  };
}
