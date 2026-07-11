{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (_: prev: {
      openldap = prev.openldap.overrideAttrs {
        doCheck = !prev.stdenv.hostPlatform.isi686;
      };
    })
  ];
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        proton-cachyos_x86_64_v3
      ];
      package = pkgs.steam.override {
        extraPkgs = (
          pkgs: with pkgs; [
            gamemode
          ]
        );
      };
    };
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    gamescope = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    bottles
    heroic
    vulkan-tools
    gpu-viewer
    melonds
    faugus-launcher
  ];

  systemd = {
    settings.Manager = {
      DefaultLimitNOFILE = "1024:1048576";
    };
  };

  environment.variables.WAYLANDDRV_PRIMARY_MONITOR = "DP-2";
}
