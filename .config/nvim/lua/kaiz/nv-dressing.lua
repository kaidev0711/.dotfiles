local M = {
	"stevearc/dressing.nvim",
	-- event = "VeryLazy",
	-- event = "BufReadPre",

	lazy = true,
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.select(...)
		end
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.input = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.input(...)
		end
	end,
	config = function()
		require("dressing").setup({
			input = {
				border = "single",
			},
		})
	end,
}

return M
