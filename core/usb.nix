{ pkgs, ... }:

{
  # USB Automounting
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
  };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [ usbutils ];
}
