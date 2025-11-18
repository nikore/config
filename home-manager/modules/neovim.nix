{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  home.file = {
    ".config/nvim" = {
      source = ../modules/nvim;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    python313Packages.python-lsp-server
    nodePackages_latest.nodemon
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    eslint
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodePackages_latest.bash-language-server
    nodePackages_latest.graphql-language-service-cli
    dockerfile-language-server
    vue-language-server
    lua-language-server
    marksman
    markdown-oxide
    nil
    nixfmt
    nixpkgs-fmt
    zls
    gopls
    delve
    emmet-language-server
    buf
    cmake-language-server
    docker-compose-language-service
    vscode-extensions.vadimcn.vscode-lldb
    slint-lsp
    terraform-ls
    hyprls
    helix-gpt
    taplo
    tree-sitter
    statix
    lua51Packages.lua
    lua51Packages.luarocks
  ];
}
