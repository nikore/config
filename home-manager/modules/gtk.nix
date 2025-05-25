{ pkgs, ...}: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
    };
    theme = {
      name = "Catppuccin-Macchiato-Compact-Blue-dark";
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
      gtk-theme = "Catppuccin-Macchiato-Compact-Blue-dark";
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

  home.sessionVariables.GTK_THEME = "Catppuccin-Macchiato-Compact-Blue-dark";
}
