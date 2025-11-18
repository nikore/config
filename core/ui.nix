{ inputs, pkgs, lib, host, ... }: {
  imports = [ inputs.hyprland.nixosModules.default ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  programs.hyprlock.enable = true;
  programs.waybar = {
    enable = true;
    systemd.target = "none.target";
  };

  environment.systemPackages = with pkgs; [
    hyprshot
    hyprcursor
    hyprpolkitagent
    hyprlock
    hyprpaper
    playerctl
    grim
    grimblast
    libnotify
    wl-clipboard
    wlogout
    networkmanagerapplet
    xfce.thunar
    ffmpeg-headless
    ffmpegthumbnailer
    gdk-pixbuf
    libheif
    libheif.out
    xfce.tumbler
    dunst
  ];

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "blue";
  };
}
