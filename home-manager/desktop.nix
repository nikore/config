{
  inputs,
  pkgs,
  config,
  ...
}: {
  xsession.enable = true;

  nixGL.packages = inputs.nixGL.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [
    "mesa"
  ];
  nixGL.vulkan.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };

  home.packages = with pkgs; [
    (config.lib.nixGL.wrap pkgs.bitwarden-desktop)
    (config.lib.nixGL.wrap pkgs.google-chrome)
    (config.lib.nixGL.wrap pkgs.darktable)
    (config.lib.nixGL.wrap pkgs.discord)
    (config.lib.nixGL.wrap pkgs.filezilla)
    (config.lib.nixGL.wrap pkgs.gimp)
    (config.lib.nixGL.wrap pkgs.handbrake)
    (config.lib.nixGL.wrap pkgs.heroic-unwrapped)
    (config.lib.nixGL.wrap pkgs.lutris-unwrapped)
    (config.lib.nixGL.wrap pkgs.obs-studio)
    (config.lib.nixGL.wrap pkgs.plexamp)
    (config.lib.nixGL.wrap pkgs.plex-media-player)
    (config.lib.nixGL.wrap pkgs.runelite)
    (config.lib.nixGL.wrap pkgs.signal-desktop)
    (config.lib.nixGL.wrap pkgs.slack)
    (config.lib.nixGL.wrap pkgs.spotify)
    spotifyd
    (config.lib.nixGL.wrap pkgs.standardnotes)
    (config.lib.nixGL.wrap pkgs.vlc)
  ];

  programs.alacritty = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.alacritty);
    settings = {
      "colors" = {
        "bright" = {
          "black" = "#414868";
          "blue" = "#7aa2f7";
          "cyan" = "#7dcfff";
          "green" = "#9ece6a";
          "magenta" = "#bb9af7";
          "red" = "#f7768e";
          "white" = "#c0caf5";
          "yellow" = "#e0af68";
        };
        "indexed_colors" = [
          {
            "color" = "#ff9e64";
            "index" = 16;
          }
          {
            "color" = "#db4b4b";
            "index" = 17;
          }
        ];
        "normal" = {
          "black" = "#1d202f";
          "blue" = "#7aa2f7";
          "cyan" = "#7dcfff";
          "green" = "#9ece6a";
          "magenta" = "#bb9af7";
          "red" = "#f7768e";
          "white" = "#a9b1d6";
          "yellow" = "#e0af68";
        };
        "primary" = {
          "background" = "#24283b";
          "foreground" = "#c0caf5";
        };
      };
      "env" = {
        "TERM" = "xterm-256color";
      };
      "font" = {
        "normal" = {
          "family" = "JetBrainsMonoNL Nerd Font";
        };
      };
      "general" = {
        "live_config_reload" = true;
      };
      "terminal" = {
        "shell" = "${pkgs.zsh}/bin/zsh";
      };
      "window" = {
        "blur" = true;
        "decorations_theme_variant" = "Dark";
        "dynamic_title" = true;
        "opacity" = 0.95;
        "startup_mode" = "Maximized";
      };
    };
  };

  programs.brave = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.brave);
  };

  programs.rofi = {
    enable = true;
    font = "JetBrainsMonoNL Nerd Font 24";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    extraConfig = {
        modi = "calc,emoji,ssh,window,drun,run";
        case-sensitive = false;
        sidebar-mode = true;
    };
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
    theme = ./files/Arc-Dark.rasi;
  };
}
