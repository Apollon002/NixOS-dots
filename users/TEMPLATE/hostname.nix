{ ... }:

{
  # EVERY MODULE WITH THE "enable" PROPERTY CAN BE TURNED ON BY SETTING IT TO "true". THEY ARE "false" BY DEFAULT

  userSettings = {
    ### Browser ###
    browsers = {
      librewolf = {
        enable = false;
        profile = "default";
      };
    };

    ### Development ###
    dev = {
      typst.enable = false;
      latex.enable = false;
    };

    ### Editor ###
    editors = {
      # Editors
      zed.enable = false;

      # LSP's
      lsp = {
        nix.enable = false;
        typst.enable = false;
      };
      # Formatters
      formatter = {
        nix.enable = false;
      };
    };

    ### File Browser ###
    fileBrowser = "ENTER YOUR PREFERRED FILEBROWSER HERE (available: nemo)"; # Only one at a time

    ### Fonts ###
    fonts = {
      firaNerd.enable = false;
      roboto.enable = false;
      garamond.enable = false;
      lmodern.enable = false;
    };

    ### Icons ###
    icons = {
      papirus.enable = false;
      bibataCursor.enable = false;
    };

    ### Office ###
    office = {
      onlyOffice.enable = false;
      teams.enable = false;
    };

    ### Programs ###
    programs = {
      bitwarden.enable = false;
      spotify.enable = false;
      starship.enable = false;
      vesktop.enable = false;
      evince.enable = false;
      amberol.enable = false;
      gthumb.enable = false;
      microfetch.enable = false;
      simpleScan.enable = false;
      thunderbird.enable = false;
      megacmd = {
        enable = false;
        autostart = false;
      };
    };

    ### Shell config ###
    shells = {
      fish.enable = false;
    };

    ### Terminals ###
    terminals = {
      kitty.enable = false;
    };

    ### UI ###
    ui = {
      dms.enable = false;
      pywalfox.enable = false;
      gtk.enable = false;
    };

    ### Window-Manager config ###
    wmConfig = {
      niri.enable = false;
    };
  };
  # Git settings
  programs.git = {
    enable = false;
    settings = {
      user = {
        name = "NAME TO DISPLAY IN COMMITS";
        email = "EMAIL TO DISPLAY IN COMMITS";
      };
      init.defaultBranch = "main";
    };
  };

  home = {
    username = "NAME OF USER THIS CONFIG IS FOR";
    homeDirectory = "/home/<username>";
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "DEFAUTL TERMINAL EDITOR COMMAND";
    VISUAL = "DEFAULT GRAPHICAL EDITOR COMMAND (higher priority than EDITOR)";
    BROWSER = "DEFAULT BROWSER COMMAND";
    TERMINAL = "DEFAULT TERMINAL COMMAND";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web
      "text/html" = "BROWSER.desktop";
      "x-scheme-handler/http" = "BROWSER.desktop";
      "x-scheme-handler/https" = "BROWSER.desktop";
      "x-scheme-handler/about" = "BROWSER.desktop";
      "x-scheme-handler/unknown" = "BROWSER.desktop";
      # PDF
      "application/pdf" = "PDFREADER.desktop";
    };
  };

  # SET TO THE SYSTEM VERSION YOU INSTALL WITH THE ISO, DO NOT TOUCH AFTER
  home.stateVersion = "26.05";
}
