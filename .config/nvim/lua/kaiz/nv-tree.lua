-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local M = {
	{
		"kyazdani42/nvim-tree.lua",
		event = "VimEnter",
		cmd = { "NvimTreeToggle" },
		opts = {
			disable_netrw = false,
			hijack_netrw = true,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			filters = {
				custom = { ".git" },
			},
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
