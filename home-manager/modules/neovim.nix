{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      # general dependencies
      git
      lazygit
      ripgrep
      fzf
      fd
      tree-sitter # treesitter cli
      imagemagick

      # Language Servers (make sure to install these,
      # they can easily be configured via the extras available
      # for many languages: https://www.lazyvim.org/extras)
      # LUA
      lua-language-server
      stylua

      # NIX
      nil
      nixfmt
      statix

      yaml-language-server
      bash-language-server
      clang-tools
      helm-ls
      taplo
      marksman
      prettier
      shfmt
      rustup
      dockerfile-language-server
      docker-compose-language-service
      gopls
      terraform-ls
      statix
      python313Packages.python-lsp-server
      typescript-language-server
      eslint
      ansible-language-server
      autotools-language-server
      protobuf-language-server
      systemd-language-server
    ];

    plugins = with pkgs.vimPlugins; [ lazy-nvim ];

    initLua =
      # if treesitter is configured correctly,
      # the follwing language-hint will cause the embedded language
      # to be highlighted correctly:
      # lua
      let
        treesitter = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;

        # Collect all grammar derivations into a single directory
        # so nvim-treesitter can find them via install_dir
        treesitterGrammars = pkgs.symlinkJoin {
          name = "nvim-treesitter-grammars";
          paths = treesitter.dependencies;
        };

        # List of all plugins that you want to use.
        # These get turned into a linkFarm directory that Lazy uses
        # as its dev.path (see below).
        plugins = with pkgs.vimPlugins; [
          alpha-nvim
          {
            name = "aerial.nvim";
            path = aerial-nvim;
          }
          {
            name = "blink.cmp";
            path = blink-cmp;
          }
          {
            name = "bufferline.nvim";
            path = bufferline-nvim;
          }
          {
            name = "conform.nvim";
            path = conform-nvim;
          }
          {
            name = "crates.nvim";
            path = crates-nvim;
          }
          {
            name = "clangd_extensions.nvim";
            path = clangd_extensions-nvim;
          }
          {
            name = "flesh.nvim";
            path = flash-nvim;
          }
          friendly-snippets
          fzf-lua
          {
            name = "gitsigns.nvim";
            path = gitsigns-nvim;
          }
          {
            name = "grug-far.nvim";
            path = grug-far-nvim;
          }
          {
            name = "gh.nvim";
            path = gh-nvim;
          }
          {
            name = "helm-ls.nvim";
            path = helm-ls-nvim;
          }
          {
            name = "indent-blankline.nvim";
            path = indent-blankline-nvim;
          }
          {
            name = "lazydev.nvim";
            path = lazydev-nvim;
          }
          {
            name = "lazy.nvim";
            path = lazy-nvim;
          }
          LazyVim
          {
            name = "lualine.nvim";
            path = lualine-nvim;
          }
          {
            name = "markdown-preview.nvim";
            path = markdown-preview-nvim;
          }
          {
            name = "mini.ai";
            path = mini-ai;
          }
          {
            name = "mini.icons";
            path = mini-icons;
          }
          {
            name = "mini.pairs";
            path = mini-pairs;
          }
          {
            name = "neoconf.nvim";
            path = neoconf-nvim;
          }
          neotest
          neotest-golang
          neotest-python
          neotest-rust
          neotest-gtest
          {
            name = " neo-tree.nvim";
            path = neo-tree-nvim;
          }
          {
            name = "noice.nvim";
            path = noice-nvim;
          }
          {
            name = "nui.nvim";
            path = nui-nvim;
          }
          {
            name = "none-ls.nvim";
            path = none-ls-nvim;
          }
          nvim-ansible
          nvim-jdtls
          nvim-lint
          nvim-lspconfig
          nvim-treesitter
          nvim-treesitter-textobjects
          nvim-treesitter-context
          nvim-ts-autotag
          nvim-ts-context-commentstring
          {
            name = "persistence.nvim";
            path = persistence-nvim;
          }
          {
            name = "plenary.nvim";
            path = plenary-nvim;
          }
          {
            name = "render-markdown.nvim";
            path = render-markdown-nvim;
          }
          rustaceanvim
          {
            name = "snacks.nvim";
            path = snacks-nvim;
          }
          {
            name = "todo-comments.nvim";
            path = todo-comments-nvim;
          }
          {
            name = "tokyonight.nvim";
            path = tokyonight-nvim;
          }
          {
            name = "trouble.nvim";
            path = trouble-nvim;
          }
          {
            name = "ts-comments.nvim";
            path = ts-comments-nvim;
          }
          {
            name = "which-key.nvim";
            path = which-key-nvim;
          }
          vim-illuminate
          vim-startuptime
          vim-sleuth
          vim-go
          {
            name = "yanky.nvim";
            path = yanky-nvim;
          }

          # When a plugin's name in nixpkgs doesn't match what Lazy expects,
          # you can manually specify the mapping like this:
          {
            name = "catppuccin";
            path = catppuccin-nvim;
          }
        ];

        # Maps a plugin derivation to a { name, path } pair.
        # linkFarm expects this format to create a directory of symlinks
        # where each plugin is accessible by its name.
        mkEntryFromDrv =
          drv:
          if lib.isDerivation drv then
            {
              name = "${lib.getName drv}";
              path = drv;
            }
          else
            drv;

        # Creates a directory with symlinks to all plugins, keyed by name.
        # This is what Lazy uses as its local plugin source via dev.path.
        lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
      in
      # lua
      ''
        require("lazy").setup({
          defaults = {
            lazy = true,
          },
          dev = {
            -- reuse files from pkgs.vimPlugins.*
            path = "${lazyPath}",
            patterns = { "." },
            -- if a plugin isn't found in the linkFarm,
            -- Lazy will fall back to downloading it directly
            fallback = true,
          },
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },

            -- here you can enable extras like this:
            -- { import = "lazyvim.plugins.extras.editor.aerial" }, -- sybmols

            -- language specific config is often available via an extra
            -- find available languages here: https://www.lazyvim.org/extras or via :LazyExtras
            -- { import = "lazyvim.plugins.extras.lang.nix" }, -- configure lsp/formatters/treesitter etc. for nix 

            -- disable mason.nvim, use programs.neovim.extraPackages
            { "mason-org/mason-lspconfig.nvim", enabled = false },
            { "mason-org/mason.nvim", enabled = false },

            -- import/override with your plugins
            { import = "plugins" },

            -- since mason is disabled, each server needs to be explicitly
            -- configured here so nvim-lspconfig picks it up without mason
            { "neovim/nvim-lspconfig", opts = { servers = lsp_servers }},

            -- make sure nvim-treesitter is configured last,
            -- if you dont want to install all grammars you might
            -- need to use a function for ensure_installed to
            -- clear it
            {
              "nvim-treesitter/nvim-treesitter",
              -- dont run anything when installing/updating
              build = "",
              -- NOTE: when not all grammars are installed, make sure
              -- to clear encure_installed by making opts a function:
              -- opts = function(_, opts)
              --   opts.ensure_installed = {}
              --   opts.install_dir = "${treesitterGrammars}"
              --   return opts
              -- end,
              opts = {
                install_dir = "${treesitterGrammars}",
              },
            },
          },
          -- see https://www.lazyvim.org/plugins/colorscheme on how to change/install colorschemes 
          install = { colorscheme = { "tokyonight", "catppuccin" } },
          checker = { enabled = false }, -- disable automatic update checking
        })
      '';
  };

  xdg.configFile."nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim/lua;
    recursive = true;
  };
}
