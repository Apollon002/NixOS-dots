{
  programs.niri.settings.switch-events = {
    tablet-mode-on.action.spawn = [
      "bash"
      "-c"
      "gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled true"
    ];

    tablet-mode-off.action.spawn = [
      "bash"
      "-c"
      "gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false"
    ];
  };
}
