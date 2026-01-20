{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.office.onlyOffice;
in
{
  options.userSettings.office.onlyOffice.enable = lib.mkEnableOption "Install Only-Office";

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      onlyoffice-desktopeditors
      corefonts # microsoft core fonts (Arial, Times New Roman, etc.)
    ];
    fonts.fontconfig.enable = true;
    # onlyoffice has trouble with symlinks: https://github.com/ONLYOFFICE/DocumentServer/issues/1859
    home.activation.enableFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      set -eu

      fonts_dir="$HOME/.local/share/fonts"
      rm -rf "$fonts_dir" 2>/dev/null || true
      mkdir -p "$fonts_dir"

      src="${pkgs.corefonts}/share/fonts/truetype"
      if [ -d "$src" ]; then
        cp -f "$src"/* "$fonts_dir"/ 2>/dev/null || true
      fi

      chmod 755 "$fonts_dir" || true
      chmod 644 "$fonts_dir"/* 2>/dev/null || true
    '';
  };
}
