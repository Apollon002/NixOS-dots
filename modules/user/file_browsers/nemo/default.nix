{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf (config.userSettings.fileBrowser == "nemo") {
    home.packages = with pkgs; [
      nemo-with-extensions

      file-roller
      p7zip
    ];
  };
}
