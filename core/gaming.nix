{ inputs, pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      package =
        pkgs.steam.override { extraPkgs = (pkgs: with pkgs; [ gamemode ]); };
    };
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    bottles
    heroic
    vulkan-tools
    gpu-viewer
  ];

  systemd = {
    user.extraConfig = "DefaultLimitNOFILE=1024:1048576";
    settings.Manager = { DefaultLimitNOFILE = "1024:1048576"; };
  };

  environment.variables.WAYLANDDRV_PRIMARY_MONITOR = "DP-2";
}
