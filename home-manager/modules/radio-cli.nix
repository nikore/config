{ config, pkgs, ... }:

{
  programs.radio-cli = {
    enable = true;
    settings = {
      config_version = "2.3.0";
      max_lines = 7;
      country = "US";
      data = [
        {
          station = "lofi";
          url = "https://www.youtube.com/live/jfKfPfyJRdk?si=WDl-XdfuhxBfe6XN";
        }
        {
          station = "synthwave";
          url = "https://www.youtube.com/watch?v=4xDzrJKXOOY";
        }
        {
          station = "dev synthwave";
          url = "https://www.youtube.com/watch?v=gopYmb38DgM";
        }
        {
          station = "metal";
          url = "https://www.youtube.com/watch?v=3LWMFjRZQ6k";
        }
        {
          station = "Darksynth";
          url = "https://www.youtube.com/watch?v=Nn87x5B26-c";
        }
      ];
    };
  };
}
