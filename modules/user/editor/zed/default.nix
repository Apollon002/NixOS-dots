{
  config,
  lib,
  ...
}:
let
  cfg = config.userSettings.editors.zed;

in
{
  options.userSettings.editors.zed.enable = lib.mkEnableOption "Install and configure Zed-Editor";

  config = lib.mkIf cfg.enable {
    # Import matugen theme if DankMaterialShell is enabled
    programs.zed-editor.enable = true;

    ### Extensions ###
    programs.zed-editor.extensions = [
      "nix"
      "aura-theme"
      "catppuccin-icons"
      "typst"
    ];

    programs.zed-editor.userSettings = {
      ### Theme settings ###
      theme = "Aura Soft Dark";
      icon_theme = "Catppuccin Latte";
      theme_overrides = {
        "Aura Soft Dark" = {
          "border.variant" = "#21202E";
          "border" = "black";
          "title_bar.background" = "#21202E";
          "panel.background" = "#21202E";
          "panel.focused_border" = "#4E466E";
        };
      };
      ### UI ####
      #  status_bar = {
      #     "experimental.show" = false;
      #  };
      project_panel = {
        "default_width" = 400;
        "auto_fold_dirs" = false;
        "starts_open" = true;
        scrollbar = {
          "show" = "never";
        };
        indent_guides = {
          "show" = "never";
        };
      };
      outline_panel = {
        "default_width" = 300;
        indent_guides = {
          "show" = "never";
        };
      };
      file_finder = {
        "modal_max_width" = "large";
      };

      ### Editor config ###
      vim_mode = true;
      tab_size = 4;
      buffer_font_family = "FiraCode Nerd Font";
      cursor_blink = false;

      # Turn off AI
      disable_ai = true;

      ### Language settings ###
      languages = {
        # Nix
        Nix = {
          "tab_size" = 2;
          formatter = {
            external = {
              "command" = "nixfmt";
            };
          };
        };
      };
    };
    programs.zed-editor.userKeymaps = [
      {
        context = "";
        bindings = {
          "alt-t" = "terminal_panel::Toggle";
          "alt-b" = "workspace::ToggleBottomDock";
          "alt-d" = "debug_panel::ToggleFocus";
          "ctrl-q" = "pane::CloseActiveItem";
          "alt-q" = "tab_switcher::Toggle";
        };
      }
      {
        context = "vim_mode == normal || (ProjectPanel && !editing) || !Editor && !Terminal";
        bindings = {
          "space f f" = "file_finder::Toggle";
          "space e" = "workspace::ToggleLeftDock";
          "space r" = "workspace::ToggleRightDock";
          "space e e" = "project_panel::ToggleFocus";
          "space e g" = "git_panel::ToggleFocus";
          "space e o" = "outline_panel::ToggleFocus";
          "space e c" = "collab_panel::ToggleFocus";
          "space l s p" = "lsp_tool::ToggleMenu";
          "space d" = "editor::ToggleDiagnostics";
          "space d i" = "editor::ToggleInlineDiagnostics";
          "space n" = "notification_panel::ToggleFocus";
        };
      }
      {
        context = "ProjectPanel && !editing";
        bindings = {
          "a" = "project_panel::NewFile";
          "d" = "project_panel::Delete";
          "r" = "project_panel::Rename";
          "y" = "project_panel::Copy";
          "x" = "project_panel::Cut";
          "p" = "project_panel::Paste";
        };
      }
    ];
  };
}
