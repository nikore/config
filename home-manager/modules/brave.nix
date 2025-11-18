{ config, pkgs, ... }:
{
  programs.brave = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.brave);
  };
}
