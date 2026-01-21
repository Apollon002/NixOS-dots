{ config, lib, ... }:
let
  cfg = config.systemSettings.audio.pipewire;
in
{
  options.systemSettings.audio.pipewire.enable = lib.mkEnableOption "Enable pipewire for audio";

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true; # give pipewire realtime priority
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };
}
