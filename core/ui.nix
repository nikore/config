{ inputs, pkgs, lib, host, ... }: {
  imports = [ inputs.hyprland.nixosModules.default ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland.override {
          hyprland =
            inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
        };
    };
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
    thunar
    tumbler
    fprintd
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";
  };
}
