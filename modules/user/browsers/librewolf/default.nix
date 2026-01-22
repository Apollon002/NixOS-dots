{
  config,
  pkgs,
  pkgsStable,
  lib,
  inputs,
  ...
}:
let
  cfg = config.userSettings.browsers.librewolf;

  # Profiles
  profileMap = {
    private = {
      name = "Private";
      extensions.packages = with inputs.firefoxAddons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        bitwarden
        sponsorblock
        pywalfox
        darkreader
      ];
    };
    default = {
      name = "Default";
    };
  };
in
{
  options.userSettings.browsers.librewolf = {
    enable = lib.mkEnableOption "Enable librewolf ";
    profile = lib.mkOption {
      description = "Profile for librewolf";
      type = lib.types.enum (builtins.attrNames profileMap);
      default = "default";
      example = "private";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.librewolf.enable = true;
    programs.librewolf.package = pkgsStable.librewolf;
    programs.librewolf.profiles.${cfg.profile} = profileMap.${cfg.profile};
  };
}
