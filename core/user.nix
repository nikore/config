{ lib, pkgs, ... }:
{
  users.users.matt = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "gamemode"
    ];
    home = "/home/matt";
    shell = lib.getExe pkgs.zsh;
    uid = 1000;
  };

  programs.zsh.enable = true;
}
