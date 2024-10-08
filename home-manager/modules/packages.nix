{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    bazelisk
    bitwarden-cli
    bottom
    docker-client
    curl
    fastfetch
    fd
    fzf
    git-extras
    glibcLocales
    grpcurl
    go-jira
    helmfile
    htop
    jq
    k9s
    kind
    krew
    kubectl
    kubectx
    kubernetes-helm
    lazygit
    lazydocker
    lsd
    lua
    minio-client
    mtr
    nodejs
    nodePackages.npm
    pass
    ripgrep
    rustup
    spotify-player
    tmate
    tmux
    tmuxinator
    wget
    xdg-utils
    yq-go
    zsh
    zx
    #fonts
    font-awesome
    openmoji-color
    google-fonts
    ubuntu_font_family
    roboto
    liberation_ttf
    dejavu_fonts
    nerdfonts
  ];
}
