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
      limine = {
        enable = true;
        efiSupport = true;
        secureBoot.enable = true;
        maxGenerations = 5;
        extraEntries = ''
          /Windows
          //Windows 10
                  protocol: efi
                  # This tells the efi protocol to call the specified EFI file and load it.
                  path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
                  comment: Boot Microsoft Windows
        '';
      };
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
    binfmt = {
      emulatedSystems = [
        "aarch64-linux"
        "armv7l-linux"
      ];
      preferStaticEmulators = true;
    };
  };
}
