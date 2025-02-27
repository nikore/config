{ pkgs, config, ... }:
let
  locale = "en_US.UTF-8";
in 
{
  home = {
    stateVersion = "24.05";

    homeDirectory = "/home/${config.home.username}"; 

    sessionVariables = {
      LANG = locale;
      LANGUAGE = locale;
      LC_ALL = locale;
      VISUAL = "nvim";
      EDITOR = "nvim";
      GTK_THEME = "Dracula";
    };
  }; 

  imports = [
    ./modules/packages.nix
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
