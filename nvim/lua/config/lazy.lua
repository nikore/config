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
  },
  defaults = {
    lazy = false,
    version = "*",
  },
  install = { colorscheme = { "themes.tokyonight" } },
  checker = { enabled = true },
})
