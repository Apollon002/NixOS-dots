{ config, lib, ... }:
let
  cfg = config.userSettings.programs.starship;
  dmsEnabled = config.userSettings.ui.dms.enable;
in
{
  config = lib.mkIf (cfg.enable && !dmsEnabled) {
    programs.starship.settings = {
      format = lib.concatStrings [
        "[](color_bar1)"
        "$os"
        "$username"
        "[](bg:color_bar2 fg:color_bar1)"
        "$directory"
        "[](fg:color_bar2 bg:color_bar3)"
        "$git_branch"
        "$git_status"
        "[](fg:color_bar3 bg:color_bar4)"
        "$c"
        "$cpp"
        "$rust"
        "$golang"
        "$nodejs"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "[](fg:color_bar4 bg:color_bar5)"
        "$docker_context"
        "$conda"
        "$pixi"
        "[](fg:color_bar5 bg:color_bar6)"
        "$time"
        "[ ](fg:color_bar6)"
        "$line_break"
        "$character"
      ];

      palette = "default_dark";

      palettes = {
        default_dark = {
          color_text-white = "#fbf1c7";
          color_text-black = "black";
          color_green = "#98971a";
          color_purple = "#b16286";
          color_red = "#cc241d";
          color_bar1 = "#d6afff";
          color_bar2 = "#cd79e2";
          color_bar3 = "#b157cb";
          color_bar4 = "#7d2bd4";
          color_bar5 = "#5e5ad8";
          color_bar6 = "#2b46ee";
        };
      };

      os = {
        disabled = false;
        style = "bg:color_bar1 fg:color_text-black";

        symbols = {
          NixOS = "";
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          AOSC = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          Pop = "";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:color_bar1 fg:color_text-black";
        style_root = "bg:color_bar1 fg:color_text-black";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:color_text-white bg:color_bar2";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";

        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:color_bar3";
        format = "[[ $symbol $branch ](fg:color_text-white bg:color_bar3)]($style)";
      };

      git_status = {
        style = "bg:color_bar3";
        format = "[[($all_status$ahead_behind )](fg:color_text-white bg:color_bar3)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      java = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:color_bar4";
        format = "[[ $symbol( $version) ](fg:color_text-white bg:color_bar4)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:color_bar5";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bar5)]($style)";
      };

      conda = {
        style = "bg:color_bar5";
        format = "[[ $symbol( $environment) ](fg:#83a598 bg:color_bar5)]($style)";
      };

      pixi = {
        style = "bg:color_bar5";
        format = "[[ $symbol( $version)( $environment) ](fg:color_text-white bg:color_bar5)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bar6";
        format = "[[  $time ](fg:color_text-white bg:color_bar6)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_bar1)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_bar1)";
        vimcmd_replace_one_symbol = "[](bold fg:color_bar5)";
        vimcmd_replace_symbol = "[](bold fg:color_bar5)";
        vimcmd_visual_symbol = "[](bold fg:color_bar2)";
      };
    };
  };
}
