local M = {
	"akinsho/bufferline.nvim",
	-- event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	-- event = "BufWinEnter",
	-- event = "VimEnter", -- Replace with the desired event
	event = "VeryLazy",
	dependencies = {
		{
			"famiu/bufdelete.nvim",
		},
	},
}
function M.config()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			-- numbers = "buffer_id",
			diagnostics_update_in_insert = true,
			separator_style = "thin",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
		-- options = {
		--   close_command = "Bdelete! %d",    -- can be a string | function, see "Mouse actions"
		--   right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		--   offsets = { { filetype = "NvimTree", text = "Kaiz" } },
		--   diagnostics = "nvim_lsp",
		--   diagnostics_update_in_insert = true,
		--   diagnostics_indicator = function(count, level, diagnostics_dict, context)
		--     local icon = level:match("error") and " " or " "
		--     return " " .. icon .. count
		--   end,
		-- },
	})
end

return M
