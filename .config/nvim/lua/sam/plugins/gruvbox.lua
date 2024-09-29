return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_transparent_background = 1
		-- vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_statusline_style = "original"
		-- vim.g.gruvbox_material_float_style = "dim"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
