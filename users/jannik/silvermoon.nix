{ ... }:

{
  userSettings = {
    ### Window Manager ###
    wm.enable = [ "niri" ];

    ### Browser ###
    browsers.enable = [ "librewolf" ];
    browsers.librewolf.profile = "private";

    ### File Browser ###
    fileBrowser = "nemo";
    ### Terminal ###
    kitty.enable = true;
    shell.fish.enable = true;
    starship.enable = true;

    ### Fonts ###
    fonts.firaNerd.enable = true;
    fonts.roboto.enable = true;

    ### Editor ###
    editors.enable = [ "zed" ];
    # Languages #
    # Nix
    editors.lsp.nix.enable = true;
    editors.formatter.nix.enable = true;

    ### Icons ###
    icons.bibataCursor.enable = true;
    icons.papirus.enable = true;

    ### UI ###
    ui.dms.enable = true;
    ui.pywalfox.enable = true;
    ui.gtk.enable = true;

    ### Security ###
    bitwarden.enable = true;
  };

  # Git settings
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Apollon002";
        email = "kontakt@jannikzenker.de";
      };
      init.defaultBranch = "main";
    };
  };

  home = {
    username = "jannik";
    homeDirectory = "/home/jannik";
  };

  home.stateVersion = "25.11";
}
