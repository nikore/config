{
  config,
  inputs,
  ...
}:
{
  programs.helium = {
    enable = true;
    package = inputs.helium.packages.x86_64-linux.helium;
    flags = [
      "--start-maximized"
      "--force-dark-mode"
      "--ozone-platform-hint=auto"
      "--enable-features=WaylandWindowDecorations"
      "--enable-wayland-ime=true"
    ];
    policies = {
      "BrowserSignin" = 0;
      "PasswordManagerEnabled" = false;
      "SyncDisabled" = true;
      "BookmarBarEnabled" = false;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [ "en-US" ];
      "ExtensionInstallForcelist" = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
        "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
        "bkdgflcldnnnapblkhphbgpggdiikppg" # DuckDuckGo
        "lckanjgmijmafbedllaakclkaicjfmnk" # ClearURLs
      ];
    };
  };
}
