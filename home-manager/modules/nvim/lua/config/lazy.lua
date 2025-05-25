-- NOTE: This bootstraps Lazy package manager on new installs from the stable branch on git
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
  install = {
    missing = true,
    colorscheme = { "catppuccin-macchiato" },
  },
  checker = { enabled = true },
})
