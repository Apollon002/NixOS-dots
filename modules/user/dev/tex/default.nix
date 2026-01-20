{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.userSettings.latex;
in
{
  options.userSettings.latex.enable = lib.mkEnableOption "Install Latex (full)";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (texlive.combine {
        inherit (texlive)
          # Base
          scheme-small
          latexmk # Perl script for automated build process

          # LuaLatex / Fonts
          fontspec
          luaotfload
          lualatex-math

          # Math packages
          amsmath
          amsfonts
          amssymb
          mathtools
          physics

          # Layout & colors
          geometry
          xcolor
          setspace
          fancyhdr
          microtype

          # Graphics and tables
          graphicx
          booktabs
          longtable
          array
          multirow
          tabularx
          float
          caption
          subcaption

          # References & links
          hyperref
          cleverref

          # Language & quotes
          babel
          csquotes

          # Bibliography
          biblatex
          biber

          # Beamer
          beamer

          # Code
          listings
          minted

          # Utilities
          etoolbox
          xkeyval
          iftex
          ;
      })
    ];
  };
}
