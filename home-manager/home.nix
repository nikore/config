{ pkgs, config, ... }:
let
  locale = "en_US.UTF-8";
in 
{
  home = {
    stateVersion = "25.11";

    homeDirectory = "/home/${config.home.username}"; 

    sessionVariables = {
      LANG = locale;
      LANGUAGE = locale;
      LC_ALL = locale;
      VISUAL = "nvim";
      EDITOR = "nvim";
    };
  };

  xresources.properties = { 
    "Xft.dpi" = 91;
    "Xft.antialias" = 1;
    "Xft.hinting" = 1;
    "Xft.rgba" = "rgb";
    "Xft.hintstyle" = "hintslight";
    "Xft.lcdfilter" = "lcddefault";
  };

  imports = [
    ./modules/packages.nix
    ./modules/lsd.nix
    ./modules/git.nix
    ./modules/gh.nix
    ./modules/go.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/fzf.nix
    ./modules/tmux.nix
    ./modules/lazygit.nix
    ./modules/neovim.nix
    ./modules/fonts.nix
  ];

  programs.home-manager.enable = true;
}
