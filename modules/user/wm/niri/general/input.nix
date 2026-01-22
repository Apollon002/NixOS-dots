{
  programs.niri.settings.input = {
    keyboard = {
      xkb.layout = "de";
      repeat-delay = 200;
      repeat-rate = 40;
      track-layout = "global";
      numlock = true;
    };

    touchpad = {
      tap = true;
      dwt = true;
      drag = true;
      drag-lock = true;
      accel-speed = 0.2;
      accel-profile = "adaptive";
      scroll-factor = 1.0;
      scroll-method = "two-finger";
      # natural-scroll = ...; # auskommentiert bei dir
      # left-handed = ...;    # auskommentiert bei dir
    };

    mouse = {
      accel-speed = 0.0;
      accel-profile = "flat";
      scroll-factor = 1.0;
      # left-handed = ...; # auskommentiert bei dir
    };

    trackpoint = {
      accel-speed = 0.2;
      accel-profile = "adaptive";
      scroll-method = "on-button-down";
      # left-handed = ...; # auskommentiert bei dir
    };

    trackball = {
      accel-speed = 0.2;
      accel-profile = "adaptive";
      scroll-method = "on-button-down";
      # left-handed = ...; # auskommentiert bei dir
    };

    tablet = {
      map-to-output = "eDP-1";
      # enable = false; # bei dir nur kommentiert ("// off"), daher nicht gesetzt
      # left-handed = ...;
      # calibration-matrix = [ [ 1.0 0.0 0.0 ] [ 0.0 1.0 0.0 ] ];
    };

    touch = {
      map-to-output = "eDP-1";
      # enable = false; # bei dir nur kommentiert ("// off"), daher nicht gesetzt
    };

    # // disable-power-key-handling
    power-key-handling.enable = false;

    warp-mouse-to-focus.enable = true;

    focus-follows-mouse = {
      enable = true;
      max-scroll-amount = "0%";
    };

    mod-key = "Super";
    mod-key-nested = "Alt";
  };
}
