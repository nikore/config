{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "niflheim";
    domain = "nikore.net";
    defaultGateway = "192.168.68.1";
    nameservers = [
      "10.10.0.2"
      "10.10.0.3"
    ];
    interfaces = {
      enp12s0.ipv4.addresses = [
        {
          address = "192.168.68.5";
          prefixLength = 24;
        }
      ];
    };
    networkmanager = {
      enable = true;
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
