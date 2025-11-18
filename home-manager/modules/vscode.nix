{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.vscode);
    profiles.default = {
      userSettings = {
        editor = {
          FontFamily =
            "'JetbrainsMono Nerd Font', 'monospace', monospace, 'Droid Sans Fallback'";
          fontLigatures = true;
          inlineSuggest.enabled = true;
          bracketPairColorization.enabled = true;
          minimap.enabled = false;
        };
        files.exclude = {
          "**/.git" = true;
          "**/.svn" = true;
          "**/.hg" = true;
          "**/CVS" = true;
          "**/.DS_Store" = true;
          "**/Thumbs.db" = true;
          "**/*.olean" = true;
        };
      };
      extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
        golang.go
        ziglang.vscode-zig
        xaver.clang-format
        ms-python.python
        ms-vscode.cpptools-extension-pack
        esbenp.prettier-vscode
        vscodevim.vim
        editorconfig.editorconfig
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-vscode-remote.vscode-remote-extensionpack
        tamasfe.even-better-toml
        njpwerner.autodocstring
        bazelbuild.vscode-bazel
        fill-labs.dependi
      ];
    };
  };
}
