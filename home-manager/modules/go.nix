{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;

    goPath = "projects/go";
  };
}
