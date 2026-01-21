# Inspired by https://github.com/librephoenix/nixos-config/blob/main/modules/system/users/default.nix
{ config, lib, ... }:

let
  cfg = config.systemSettings;
in
{
  options.systemSettings = {
    users = lib.mkOption {
      description = "List of users that will be created for the system.";
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [
        "username"
        "guest"
      ];
    };

    sudoUsers = lib.mkOption {
      description = "List of users to be granted sudo privileges (wheel). Must also be in systemSettings.users";
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [ "username" ];
    };
  };

  config = {
    users.users = lib.listToAttrs (
      map (user: {
        name = user;
        value = {
          isNormalUser = true;
          createHome = true;
          initialPassword = "12345";
          extraGroups = [
            "networkmanager"
            "input"
            "dialout"
            "video"
            "render"
            "lp"
            "scanner"
          ]
          ++ lib.optionals (lib.elem user cfg.sudoUsers) [
            "wheel"
            "lpadmin"
          ];
        };
      }) cfg.users
    );
  };
}
