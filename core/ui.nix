{
  pkgs,
  ...
}:
{
  programs = {
    niri = {
      enable = true;
    };
    xfconf = {
      enable = true;
    };
  };

  services = {
    gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libnotify
    wl-clipboard
    gdk-pixbuf
    libheif
    libheif.out
    fprintd
    xwayland-satellite
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "macchiato";
    accent = "blue";
  };

  systemd.user.services.niri.enableDefaultPath = false;
}
