{ config, pkgs, ... }: {
  programs.halloy = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.halloy);
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
