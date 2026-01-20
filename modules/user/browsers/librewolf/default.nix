{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  isEnabled = builtins.elem "librewolf" (config.userSettings.browsers.enable or [ ]);
  profile = config.userSettings.browsers.librewolf.profile;

  # Profiles
  profileMap = {
    private = {
      name = "Private";
      extensions.packages = with inputs.firefoxAddons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        bitwarden
        sponsorblock
        pywalfox
      ];
    };
    default = {
      name = "Default";
    };
  };
in
{
  options.userSettings.browsers.librewolf.profile = lib.mkOption {
    description = "Profile for librewolf";
    type = lib.types.enum (builtins.attrNames profileMap);
    default = "default";
    example = "private";
  };

  config = lib.mkIf isEnabled {
    programs.librewolf.enable = true;
    programs.librewolf.profiles.${profile} = profileMap.${profile};
  };
}
