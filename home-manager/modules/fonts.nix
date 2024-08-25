{ config, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMonoNL Nerd Font Regular" ];
      emoji = [ "OpenMoji Color" ];
    };
  };
}
