{ ... }: {
  imports = [ ./hardware-configuration.nix ];

  networking = {
    hostName = "niflheim";
    domain = "nikore.net";
    nameservers = [ "10.10.0.2" "10.10.0.3" ];
    networkmanager = {
      enable = true;
      ensureProfiles = {
        profiles = {
          "Wired Connnection 1" = {
            connection = {
              type = "ethernet";
              id = "Wired Connection 1";
              interface-name = "enp12s0";
              autoconnect = true;
            };
            ipv4 = {
              method = "manual";
              address = "192.168.68.5/24";
              gateway = "192.168.68.1";
            };
          };
        };
      };
    };
  };

  services = {
    fstrim.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
    resolved.enable = true;
    dbus.enable = true;
    envfs.enable = true;
    timesyncd.enable = true;
    printing.enable = true;
    fwupd.enable = true;
  };

  system.stateVersion = "25.05";
}
