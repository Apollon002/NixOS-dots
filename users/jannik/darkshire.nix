{ ... }:

{
  # EVERY MODULE WITH THE "enable" PROPERTY CAN BE TURNED ON BY SETTING IT TO "true". THEY ARE "false" BY DEFAULT

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
      latex.enable = true;
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
      vesktop.enable = false;
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
        email = "accounts@jannikzenker.de";
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
    VISUAL = "zed";
    BROWSER = "librewolf";
    TERMINAL = "kitty";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      # PDF
      "application/pdf" = "org.gnome.Evince.desktop";
    };
  };

  # SET TO THE SYSTEM VERSION YOU INSTALL WITH THE ISO, DO NOT TOUCH AFTER
  home.stateVersion = "26.05";
}
