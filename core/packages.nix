{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    sshfs
    keymapp
    zip
    unzip
    pciutils
    p7zip
    binutils
    ethtool
    dmidecode
    iotop
    dool
    nvme-cli
    nvtopPackages.full
  ];

  programs.fuse = {
    enable = true;
    userAllowOther = true;
  };
}
