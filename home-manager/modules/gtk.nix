{ pkgs, ...}: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
    };
    theme = {
      name = "catppuccin-macchiato-blue-compact";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        accents = ["blue"];
        variant = "macchiato";
      };
    };
    iconTheme = {
      name = "Numix-Circle";
      package = pkgs.numix-icon-theme-circle;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
    gtk4 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
  dconf.settings = {
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gnome/desktop/interface" = {
      gtk-theme = "catppuccin-macchiato-blue-compact";
      color-scheme = "prefer-dark";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "Fusion";
  };

  home.sessionVariables.GTK_THEME = "catppuccin-macchiato-blue-compact";

  services.xsettingsd = {
    enable = true;
    settings = {
      "Xft/Hinting" = 1;
      "Xft/HintStyle" = "hintslight";
      "Xft/Antialias" = 1;
      "Xft/RGBA" = "rgb";
      "Xft/dpi" = 91;
      "Xft/lcdfilter" = "lcddefault";
      "Gtk/MonospaceFontName" = "JetBrainsMono Nerd Font 10";
      "Gtk/FontName" = "Noto Sans Display 10";
    };
  };
}
