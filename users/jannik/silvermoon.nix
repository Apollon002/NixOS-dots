{ ... }:

{
  userSettings = {
    ### Browser ###
    browsers = {
      librewolf = {
        enable = true;
        profile = "private";
      };
    };

    ### Development ###
    dev = {
      typst.enable = true;
      latex.enable = false;
    };

    ### Editor ###
    editors = {
      # Editors
      zed.enable = true;

      # LSP's
      lsp = {
        nix.enable = true;
      };
      # Formatters
      formatter = {
        nix.enable = true;
      };
    };

    ### File Browser ###
    fileBrowser = "nemo"; # Only one at a time

    ### Fonts ###
    fonts = {
      firaNerd.enable = true;
      roboto.enable = true;
    };

    ### Icons ###
    icons = {
      papirus.enable = true;
      bibataCursor.enable = true;
    };

    ### Office ###
    office = {
      onlyOffice.enable = true;
      teams.enable = true;
    };

    ### Programs ###
    programs = {
      bitwarden.enable = true;
      spotify.enable = true;
      starship.enable = true;
      vesktop.enable = true;
      evince.enable = true;
      amberol.enable = true;
      gthumb.enable = true;
      microfetch.enable = true;
      simpleScan.enable = true;
      thunderbird.enable = true;
      megacmd = {
        enable = true;
        autostart = true;
      };
    };

    ### Shell config ###
    shells = {
      fish.enable = true;
    };

    ### Terminals ###
    terminals = {
      kitty.enable = true;
    };

    ### UI ###
    ui = {
      dms.enable = true;
      pywalfox.enable = true;
      gtk.enable = true;
    };

    ### Window-Manager config ###
    wmConfig = {
      niri.enable = true;
    };
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

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "zeditor";
    BROWSER = "librewolf";
    TERMINAL = "kitty";

  };

  home.stateVersion = "26.05";
}
