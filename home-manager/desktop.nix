{
  pkgs,
  lib,
  ...
}: let
  nixgl = import <nixgl> {} ;
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
      wrapped_bin=$out/bin/$(basename $bin)
      echo "exec ${lib.getExe' nixgl.auto.nixGLDefault "nixGL"} $bin \"\$@\"" > $wrapped_bin
      chmod +x $wrapped_bin
    done
   '';
  in {
  xsession.enable = true;
  home.packages = with pkgs; [
    nixgl.auto.nixGLDefault
    (nixGLWrap pkgs.bitwarden-desktop)
    (nixGLWrap pkgs.darktable)
    (nixGLWrap pkgs.discord)
    (nixGLWrap pkgs.filezilla)
    (nixGLWrap pkgs.gimp)
    (nixGLWrap pkgs.handbrake)
    (nixGLWrap pkgs.heroic-unwrapped)
    (nixGLWrap pkgs.lutris-unwrapped)
    (nixGLWrap pkgs.obs-studio)
    (nixGLWrap pkgs.plexamp)
    (nixGLWrap pkgs.plex-media-player)
    (nixGLWrap pkgs.signal-desktop)
    (nixGLWrap pkgs.slack)
    (nixGLWrap pkgs.spotify)
    spotifyd
    (nixGLWrap pkgs.standardnotes)
    (nixGLWrap pkgs.vlc)
  ];

  programs.alacritty = {
    enable = true;
    package = (nixGLWrap pkgs.alacritty);
    settings = {
      "shell" = "${pkgs.zsh}/bin/zsh";
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
      "live_config_reload" = true;
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
    package = (nixGLWrap pkgs.brave);
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" #bitwarden
    ];
  };

  programs.google-chrome = {
    enable = true;
    package = (nixGLWrap pkgs.google-chrome);
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
