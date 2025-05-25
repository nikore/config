{ config, pkgs, ... }:

{
  programs.lsd = {
    enable = true;
    enableZshIntegration = true;
  };
}
