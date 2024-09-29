return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			go = { "golangcilint" },
			javascript = { "eslint", "eslint_d" },
			typescript = { "eslint", "eslint_d" },
			javascriptreact = { "eslint", "eslint_d" },
			typescriptreact = { "eslint", "eslint_d" },
			-- svelte = { "eslint_d" },
			vue = { "eslint", "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint(nil, {ignore_errors = true})
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint(nil, {ignore_errors = true})
		end, { desc = "Trigger linting for current file" })
	end,
}
