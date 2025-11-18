{ lib, ... }:

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
      g = "git";
      h = "helm";
      hm = "home-manager";
      lg = "lazygit";
      k = "kubectl";
      b = "bazel";
    };

    initContent = lib.mkMerge [
      (lib.mkBefore (builtins.readFile ./zsh/extrafirst.zsh))
      (lib.mkAfter (builtins.readFile ./zsh/extra.zsh))
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "1password"
        "archlinux"
        "bazel"
        "docker"
        "docker-compose"
        "fzf"
        "genpass"
        "gh"
        "git"
        "golang"
        "helm"
        "kubectl"
        "kubectx"
        "rust"
        "ssh"
        "ssh-agent"
        "systemadmin"
        "tmux"
      ];
      theme = "afowler";
    };
  };
}
