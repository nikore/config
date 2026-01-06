{ pkgs, ... }: {
  virtualisation.podman = {
    enable = true;

    # Create a `docker` alias for podman, to use it as a drop-in replacement
    dockerCompat = true;
    dockerSocket.enable = true;

    # Required for containers under podman-compose to be able to talk to each other.
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.variables.DBX_CONTAINER_MANAGER = "podman";
  users.extraGroups.podman.members = [ "matt" ];

  environment.systemPackages = with pkgs; [
    nvidia-docker
    podman-compose
    podman-tui
    docker-compose
    qemu
    distrobox
  ];
}
