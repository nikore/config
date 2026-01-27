{ pkgs, ... }: {
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";
    cursors.enable = true;
    qt5ct.enable = true;
    firefox.force = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-blue-compact";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        accents = [ "blue" ];
        variant = "macchiato";
      };
    };
    gtk3 = { extraConfig.gtk-application-prefer-dark-theme = true; };
    gtk4 = { extraConfig.gtk-application-prefer-dark-theme = true; };
  };
  dconf.settings = {
    "org/gtk/settings/file-chooser" = { sort-directories-first = true; };
    "org/gnome/desktop/interface" = {
      gtk-theme = "catppuccin-macchiato-blue-compact";
      color-scheme = "prefer-dark";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
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
