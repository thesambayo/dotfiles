return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						-- Ctrl-q open files added to quickfix list
						-- to add a file to quick list, when you fuzzyfind, press tab to add (there will be a visible color change)
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},

			pickers = {
				find_files = {
					previewer = false,
					-- path_display = formattedName,
					layout_config = {
						height = 0.4,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				-- git_files = {
				--   previewer = false,
				--   -- path_display = formattedName,
				--   layout_config = {
				--     height = 0.4,
				--     prompt_position = "top",
				--     preview_cutoff = 120,
				--   },
				-- },
				buffers = {
					mappings = {
						i = {
							-- Ctrl-d to delete buffer in fuzzy find
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["<C-d>"] = actions.delete_buffer,
						},
					},
					previewer = false,
					initial_mode = "normal",
					-- theme = "dropdown",
					layout_config = {
						height = 0.4,
						width = 0.6,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				-- current_buffer_fuzzy_find = {
				--   previewer = true,
				--   layout_config = {
				--     prompt_position = "top",
				--     preview_cutoff = 120,
				--   },
				-- },
				live_grep = {
					only_sort_text = true,
					previewer = true,
				},
				-- grep_string = {
				--   only_sort_text = true,
				--   previewer = true,
				-- },
				-- lsp_references = {
				--   show_line = false,
				--   previewer = true,
				-- },
				-- treesitter = {
				--   show_line = false,
				--   previewer = true,
				-- },
				-- colorscheme = {
				--   enable_preview = true,
				-- },
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

		keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find word or string" })
		keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find word or string under cursor in cwd" }
		)

		keymap.set(
			"n",
			"<leader>fs",
			"<cmd>Telescope lsp_document_symbols<cr>",
			{ desc = "Fuzzy find document symbols" }
		)

		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
