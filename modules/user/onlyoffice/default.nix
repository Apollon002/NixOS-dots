{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.onlyOffice;
in
{
  options.userSettings.onlyOffice.enable = lib.mkEnableOption "Install Only-Office";

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      onlyoffice-desktopeditors
      corefonts # microsoft core fonts (Arial, Times New Roman, etc.)
    ];
    fonts.fontconfig.enable = true;
    # onlyoffice has trouble with symlinks: https://github.com/ONLYOFFICE/DocumentServer/issues/1859
    home.activation.enableFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      rm -rf ~/.local/share/fonts
      mkdir -p ~/.local/share/fonts
      cp ${pkgs.corefonts}/share/fonts/truetype/* ~/.local/share/fonts/
      chmod 544 ~/.local/share/fonts
      chmod 444 ~/.local/share/fonts/*
    '';
  };
}
