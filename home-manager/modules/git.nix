{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    userName = "Matt Christiansen";
    userEmail = "matt@nikore.net";

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-number decorations";
        line-number = "relative";
        navigate = "true";
        decorations = "commit-decoration file-style";
        commit-decoration-style = "blue box ul";
        file-style = "blue ul";
      };
    };

    extraConfig = {
      merge = {
        conflictstyle = "diff3";
      };

      diff = {
        colorMoved = "default";
      };

      push = {
        default = "simple";
      };

      color = {
        ui = true;
      };

      submodule = {
        recurse = "true";
      };

      pull = {
        ff = "only";
      };

      init = {
        defaultBranch = "main";
      };
    };

    aliases = {
      a = "add";
      c = "commit";
      p = "push";
      d = "diff";
      graph = "log --graph --color --pretty=format:'%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%x20(%ce)%n%x20%s%n'";
      one = "log --oneline --all";
      stat = "status -sb";
      last = "show -1";
      unstage = "reset HEAD --";
      cached = "diff --cached";
      ignore = "!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}