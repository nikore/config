-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "numToStr/Comment.nvim", opts = {} },
		{ "tpope/vim-sleuth" },
		{ import = "custom.plugins" },
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
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
