{ inputs, pkgs, lib, host, ... }: {
  imports = [ inputs.hyprland.nixosModules.default ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland.overrideAttrs {
          patches = [ ../temp_fix_hyprland.patch ];
        };
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland.override {
          hyprland =
            inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs {
              patches = [ ../temp_fix_hyprland.patch ];
            };
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
