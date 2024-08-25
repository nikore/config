{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;

    history = {
      extended = true;
      size = 10000;
    };

    shellAliases = {
      ll = "ls -l";
      g = "git";
      h = "helm";
      hm = "home-manager";
      lg = "lazygit";
      k = "kubectl";
    };

    initExtraFirst = builtins.readFile ./zsh/extrafirst.zsh;
    initExtra = builtins.readFile ./zsh/extra.zsh;

    oh-my-zsh = {
      enable = true;
      plugins = ["archlinux" "bazel" "docker" "docker-compose" "genpass" "git" "golang" "helm" "kubectl" "kubectx" "rust" "ssh-agent" "systemadmin" "tmux"];
      theme = "afowler";
    };
  };
}
