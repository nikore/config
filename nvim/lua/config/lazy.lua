-- NOTE: This bootstraps Lazy package manager on new installs from the stable branch on git
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob;none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: This is where Lazy is configured and includes all local plugins
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "numToStr/Comment.nvim", opts = {} },
    { "tpope/vim-sleuth" },

    -- NOTE: This is all my custom plugins
    { import = "custom.plugins" },

    -- NOTE: Like most OG neovim setups I also started with kickstart
    require("kickstart.plugins.autopairs"),
    require("kickstart.plugins.cmp"),
    require("kickstart.plugins.conform"),
    require("kickstart.plugins.debug"),
    require("kickstart.plugins.gitsigns"),
    require("kickstart.plugins.go"),
    require("kickstart.plugins.indent_line"),
    require("kickstart.plugins.lint"),
    require("kickstart.plugins.lspconfig"),
    require("kickstart.plugins.mini"),
    require("kickstart.plugins.neo-tree"),
    require("kickstart.plugins.telescope"),
    require("kickstart.plugins.todo-comments"),
    require("kickstart.plugins.treesitter"),
    require("kickstart.plugins.which-key"),

    -- themes
    require("themes.tokyonight"),
    -- require("themes.dracula"),
  },
  defaults = {
    lazy = false,
    version = "*",
  },
  install = { colorscheme = { "themes.tokyonight" } },
  checker = { enabled = true },
})
