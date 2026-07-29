{
  pkgs,
  ...
}:
{
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri.override {
        libdisplay-info = pkgs.libdisplay-info.overrideAttrs (finalAttrs: {
          version = "0.3.0";
          src = pkgs.fetchFromGitLab {
            domain = "gitlab.freedesktop.org";
            owner = "emersion";
            repo = "libdisplay-info";
            rev = finalAttrs.version;
            sha256 = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
          };
        });
      };
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
    gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = with pkgs; [
    playerctl
    libnotify
    wl-clipboard
    gdk-pixbuf
    libheif
    libheif.out
    fprintd
    libsForQt5.qt5ct
    kdePackages.qt6ct
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
