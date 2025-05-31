{config, pkgs, inputs, lib, ...}:
{
   imports = [
     inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    package = lib.mkForce (config.lib.nixGL.wrap inputs.zen-browser.packages.x86_64-linux.twilight);
    nativeMessagingHosts = [pkgs.firefoxpwa];
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true; # save webs for later reading
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;

      FirefoxHome = {
        Search = false; # Disable search box
        TopSites = false; # Disable top sites
        SponsoredTopSites = false; # Disable sponsored sites
        Highlights = false; # Disable highlights
        Pocket = false; # Disable pocket
        SponsoredPocket = false; # Disable sponsored pocket content
        Snippets = false; # Disable snippets
        Locked = false; # Don't lock these settings
      };

      # Configure start page
      Homepage = {
        StartPage = "none"; # Don't show a start page
      };

      # Disable first run and post-update pages
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
    };

    # Browser profile configuration
    profiles."default" = {
      # Search engine configuration
      search = {
        default = "ddg"; # Set DuckDuckGo as default
        force = true; # Force this search engine
        privateDefault = "ddg"; # Use same search engine in private windows
        engines = {
          "nix options" = {
            urls = [{template = "https://search.nixos.org/options?type=options&query={searchTerms}";}];
            icon = "https://nixos.org/favicon.ico";
            definedAliases = ["@no"];
          };

          "nix packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "nixos wiki" = {
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # Update once per day
            definedAliases = ["@nw"];
          };

          "github" = {
            urls = [{template = "https://github.com/search?q={searchTerms}&type=repositories";}];
            icon = "https://github.com/favicon.ico";
            definedAliases = ["@gh"];
          };

          "home manager" = {
            urls = [{template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";}];
            icon = "https://nixos.org/favicon.ico";
            definedAliases = ["@hm"];
          };

          "youtube" = {
            urls = [{template = "https://www.youtube.com/results?search_query={searchTerms}";}];
            icon = "https://www.youtube.com/favicon.ico";
            definedAliases = ["@yt"];
          };

          # Hide default search engines we don't want
          "amazon".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;
          "ecosia".metaData.hidden = true;
        };
      };

      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          clearurls
          privacy-badger
          decentraleyes
          facebook-container
          multi-account-containers
        ];
      };

      userChrome = (builtins.readFile ./zen/userChrome.css);
      userContent = (builtins.readFile ./zen/userContent.css);

      settings = {
        # Privacy settings
        "app.normandy.first_run" = false; # Disable Normandy/Shield telemetry system
        "app.shield.optoutstudies.enabled" = false; # Opt out of shield studies
        "app.update.channel" = "default"; # Use default update channel

        # General behavior settings
        "browser.aboutConfig.showWarning" = false; # Don't warn when opening about:config
        "browser.contentblocking.category" = "strict"; # Use strict content blocking
        "browser.ctrlTab.recentlyUsedOrder" = false; # Switch tabs in order, not by recency
        "browser.discovery.enabled" = false; # Disable discovery pane

        # New tab page settings
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # Browser startup settings
        "browser.shell.checkDefaultBrowser" = false; # Don't check if default browser

        # Tab settings
        "browser.tabs.allow_transparent_browser" = true; # Allow background transparency
        "browser.tabs.newtabbutton" = false; # Don't show new tab button in tab bar
        "browser.tabs.hoverPreview.enabled" = true; # Enable tab hover preview
        "browser.sessionstore.restore_pinned_tabs_on_demand" = true; # Restore pinned tabs to their original URL

        # Interface settings
        "browser.toolbars.bookmarks.visibility" = "never"; # Hide bookmarks toolbar

        # URL bar settings
        "browser.urlbar.quickactions.enabled" = false; # Disable URL bar quick actions
        "browser.urlbar.suggest.openpage" = false; # Don't suggest open pages
        "browser.urlbar.openintab" = true; # Open search results in new tab
        "zen.urlbar.onlyfloatingbar" = true; # Always use floating URL bar

        # Privacy and security settings
        "datareporting.policy.dataSubmissionEnable" = false; # Disable data submission
        "dom.security.https_only_mode" = true; # Use HTTPS only mode
        "dom.security.https_only_mode_ever_enabled" = true;
        "privacy.donottrackheader.enabled" = true; # Enable Do Not Track
        "privacy.trackingprotection.enabled" = true; # Enable tracking protection
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.webrtc.legacyGlobalIndicator" = false; # Disable WebRTC sharing indicator

        # Container tabs
        "zen.containers.enable_container_essentials" = true; # Enable container-specific essentials

        # Password and autofill settings - Modified for Bitwarden
        "signon.rememberSignons" = false; # Don't remember passwords in Firefox
        "browser.formfill.enable" = true; # Allow form filling (for Bitwarden)
        "signon.autofillForms" = true; # Allow autofilling (for Bitwarden)
        "signon.autofillForms.http" = true; # Allow on HTTP sites too
        "extensions.bitwarden.alwaysShowPanel" = true; # Always show Bitwarden for filling
        "browser.payments.enable" = false; # Disable payment methods

        # Extensions settings
        "extensions.pocket.enabled" = false; # Disable Pocket

        # Hardware acceleration
        "gfx.webrender.all" = true; # Force GPU acceleration
        "media.ffmpeg.vaapi.enabled" = true; # Enable VA-API acceleration
        "widget.dmabuf.force-enabled" = true; # Enable dmabuf (required for Wayland)
        "zen.widget.windows.acrylic" = false; # Disable acrylic effect

        # Reader mode
        "reader.parse-on-load.force-enabled" = true; # Force enable reader mode

        # User customization
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable userChrome.css
      };
    }; 
  };

  # Set as default browser for various MIME types
  xdg = {
    enable = true;
    mimeApps = let
      associations = builtins.listToAttrs (map (name: {
          inherit name;
          value = let
            zen-browser = inputs.zen-browser.packages.${pkgs.system}.twilight;
          in
            zen-browser.meta.desktopFile;
        }) [
          "x-scheme-handler/https"
          "x-scheme-handler/http"
          "text/html"
          "application/xhtml+xml"
          "application/x-extension-html"
          "application/x-extension-htm"
          "application/x-extension-shtml"
          "application/x-extension-xhtml"
          "application/x-extension-xht"
          "application/json"
          "text/plain"
          "x-scheme-handler/about"
          "x-scheme-handler/unknown"
          "x-scheme-handler/mailto"
        ]);
    in {
      associations.added = associations;
      defaultApplications = associations;
    };
  };
}
