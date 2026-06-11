{
  inputs,
  pkgs,
  lib,
  host,
  ...
}:
{
  imports = [ inputs.hyprland.nixosModules.default ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland.override
          { hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default; };
    };
    xfconf = {
      enable = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-volman
        thunar-vcs-plugin
        thunar-shares-plugin
        thunar-archive-plugin
        thunar-dropbox-plugin
        thunar-media-tags-plugin
      ];
    };
  };

  services = {
    tumbler.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprcursor
    hyprpolkitagent
    playerctl
    libnotify
    wl-clipboard
    gdk-pixbuf
    libheif
    libheif.out
    fprintd
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "macchiato";
    accent = "blue";
  };
}
