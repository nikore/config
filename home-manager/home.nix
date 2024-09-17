{ pkgs, lib, ... }:

let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in 
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowFreePredicate = (_: true);
    };
  };

  home = {
    stateVersion = "24.05";

    username = username;
    homeDirectory = homedir; 

    sessionVariables = {
      LANG = locale;
      LANGUAGE = locale;
      LC_ALL = locale;
      VISUAL = "nvim";
      EDITOR = "nvim";
      GTK_THEME = "Dracula";
    };

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true; 
      name = "macOS-BigSur";
      size = 24;
      package = pkgs.apple-cursor;
    };
  }; 

  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/go.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/fzf.nix
    ./modules/tmux.nix
    ./modules/lazygit.nix
    ./modules/neovim.nix
    ./modules/fonts.nix
  ] ++ lib.optional (builtins.pathExists "${homedir}/.private/private.nix") "${homedir}/.private/private.nix"
    ++ lib.optional (builtins.pathExists "${homedir}/.config/home-manager/desktop.nix") "${homedir}/.config/home-manager/desktop.nix";

  programs.home-manager.enable = true;
}
