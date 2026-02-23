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
    nodePackages.nodemon
    nodePackages.typescript
    nodePackages.typescript-language-server
    eslint
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    nodePackages.bash-language-server
    nodePackages.graphql-language-service-cli
    dockerfile-language-server
    vue-language-server
    lua-language-server
    marksman
    markdown-oxide
    nil
    nixfmt
    nixpkgs-fmt
    #zls
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
    taplo
    tree-sitter
    statix
    lua51Packages.lua
    lua51Packages.luarocks
  ];
}
