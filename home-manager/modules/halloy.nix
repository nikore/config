{ config, pkgs, ... }:
{
  programs.halloy = {
    enable = true;
    package = pkgs.halloy;
    settings = {
      buffer.channel.topic.enabled = true;
      servers.liberachat = {
        nickname = "nikore";
        server = "irc.libera.chat";
        channels = [ "#halloy" ];
      };
    };
  };
}
