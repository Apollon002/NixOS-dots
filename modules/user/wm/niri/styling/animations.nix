{
  programs.niri.settings.animations = {
    workspace-switch.kind.spring = {
      damping-ratio = 1.0;
      stiffness = 1000;
      epsilon = 0.0001;
    };

    window-open.kind.easing = {
      duration-ms = 350;
      curve = "ease-out-expo";
      # curve-args nur nötig bei curve = "cubic-bezier"
    };

    window-close.kind.easing = {
      duration-ms = 350;
      curve = "ease-out-expo";
    };

    screenshot-ui-open.kind.easing = {
      duration-ms = 400;
      curve = "ease-out-quad";
    };

    overview-open-close.kind.easing = {
      duration-ms = 300;
      curve = "ease-out-expo";
    };

    window-movement.kind.spring = {
      damping-ratio = 1.0;
      stiffness = 800;
      epsilon = 0.0001;
    };
  };
}
