{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.systemSettings;

  availableShells = [
    "bash"
    "zsh"
    "fish"
  ];

  shellPkg = {
    bash = pkgs.bashInteractive; # bash => bashInteractive
    zsh = pkgs.zsh;
    fish = pkgs.fish;
  };

  selectedPkg = shellPkg.${cfg.shell};
in
{
  options.systemSettings.shell = lib.mkOption {
    description = "Default login shell for the system (bash uses bashInteractive).";
    type = lib.types.enum availableShells;
    default = "bash";
    example = "fish";
  };

  config = lib.mkMerge [
    # Always ensure the selected shell exists + is allowed as a login shell
    {
      environment.systemPackages = [ selectedPkg ];
      environment.shells = [ selectedPkg ];
    }

    # Default login shell:
    # - bash => bashInteractive
    # - zsh/fish => their packages
    {
      users.defaultUserShell = selectedPkg;
    }

    # Optional shell module toggles
    (lib.mkIf (cfg.shell == "fish") {
      # disable man generateCache to fix slow nixos builds
      documentation.man.generateCaches = false;
      # Enable fish and disable greeting
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          					set fish_greeting
          				'';
      };
    })

    (lib.mkIf (cfg.shell == "zsh") {
      programs.zsh.enable = true;
    })
  ];
}
