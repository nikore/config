{ config, pkgs, ... }:

let wallpaperPath = "~/Pictures/Backgrounds/lost-in-space.png";
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    wallpaper {
        monitor = 
        path = ${wallpaperPath}
        fit_mode = cover
        splash = false
      }
  '';
}
