# system default fonts, supports nerd symbold, emojies, japanese, korean and chinese
{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.systemSettings.fonts.enable = lib.mkEnableOption "Import defaul font package 'Noto'";

  config = lib.mkIf (config.systemSettings.fonts.enable) {
    fonts.packages = with pkgs; [
      # base font with everything included
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerd-fonts.noto
      noto-fonts-monochrome-emoji
    ];
  };
}
