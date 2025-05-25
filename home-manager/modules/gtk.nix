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
    platformTheme.name = "gtk";
    style = {
      name = "gtk2";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        accents = ["blue"];
        variant = "macchiato";
      };
    };
  };

  home.sessionVariables.GTK_THEME = "catppuccin-macchiato-blue-compact";
}
