{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "macOS-BigSur";
    size = 24;
    package = pkgs.apple-cursor;
  };
}
