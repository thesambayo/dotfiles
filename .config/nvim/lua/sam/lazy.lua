local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- import plugins { import = "sam.plugins.init" }, directly here
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	-- { import = "sam.plugins" },

	{ import = "sam.plugins.alpha" },
	{ import = "sam.plugins.auto-sessions" },
	{ import = "sam.plugins.autopairs" },
	{ import = "sam.plugins.bufferline" },
	-- { import = "sam.plugins.catppuccin" },
	{ import = "sam.plugins.catppuccin-gruvbox" },
	{ import = "sam.plugins.comment" },
	{ import = "sam.plugins.dressing" },
	{ import = "sam.plugins.formatting" },
	{ import = "sam.plugins.gitsigns" },
	-- { import = "sam.plugins.gruvbox" },
	{ import = "sam.plugins.indent-blankline" },
	{ import = "sam.plugins.lazygit" },
	{ import = "sam.plugins.linting" },
	{ import = "sam.plugins.lspconfig" },
	{ import = "sam.plugins.lualine" },
	{ import = "sam.plugins.neo-tree" },
	{ import = "sam.plugins.nvim-cmp" },
	-- { import = "sam.plugins.nvim-tree" },
	{ import = "sam.plugins.substitute" },
	{ import = "sam.plugins.surround" },
	{ import = "sam.plugins.telescope" },
	{ import = "sam.plugins.todo-comments" },
	{ import = "sam.plugins.treesitter" },
	{ import = "sam.plugins.trouble" },
	{ import = "sam.plugins.vim-maximizer" },
	{ import = "sam.plugins.which-key" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
