{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [
      "ntfs"
      "xfs"
    ];
    consoleLogLevel = 3;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
    initrd = {
      enable = true;
      systemd.enable = true;
    };
    tmp = {
      useTmpfs = true;
      tmpfsSize = "16%";
    };
  };
}
