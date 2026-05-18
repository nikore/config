{ lib, pkgs, ... }:
{
  users.users.matt = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "gamemode"
      "i2c"
    ];
    home = "/home/matt";
    shell = lib.getExe pkgs.zsh;
    uid = 1000;
    subUidRanges = [
      {
        startUid = 100000;
        count = 65536;
      }
    ];
    subGidRanges = [
      {
        startGid = 100000;
        count = 65536;
      }
    ];
  };

  programs.zsh.enable = true;
}
