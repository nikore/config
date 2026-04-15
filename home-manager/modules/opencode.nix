{ inputs, pkgs, ... }:
{
  programs.opencode = {
    enable = true;
    package = inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode;
    settings = {
      plugin = [
        "oh-my-openagent@latest"
      ];
    };
  };
}
