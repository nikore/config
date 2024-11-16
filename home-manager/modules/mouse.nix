{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Dracula-cursors";
    size = 24;
    package = pkgs.dracula-theme;
  };
}
