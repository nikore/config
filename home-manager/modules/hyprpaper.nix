{ config, pkgs, ... }:

let 
  wallpaperPath = "~/Pictures/Backgrounds/lost-in-space.png";
in
{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaperPath}
    wallpaper = ,${wallpaperPath}
  '';
}
