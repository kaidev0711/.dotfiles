-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local M = {
	{
		"kyazdani42/nvim-tree.lua",
		event = "VimEnter",
		opts = {
			disable_netrw = false,
			hijack_netrw = true,
			respect_buf_cwd = true,
			view = {
				-- width = 30,
				side = "right",
			},
			filters = {
				custom = { ".git" },
			},
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			-- actions = {
			-- 	open_file = {
			-- 		quit_on_open = true,
			-- 	},
			-- },
		},
	},
	{
		"rebelot/heirline.nvim",
		enabled = false,
		opts = function(_, opts)
			opts.winbar = nil
			return opts
		end,
	},
}

return M
