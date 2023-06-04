local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

function M.config()
	local status_ok, toggleterm = pcall(require, "toggleterm")
	if not status_ok then
		return
	end

	toggleterm.setup({
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})

	function _G.set_terminal_keymaps()
		local opts = { noremap = true }
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	local Terminal = require("toggleterm.terminal").Terminal

	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })
	function _LAZYDOCKER_TOGGLE()
		lazydocker:toggle()
	end

	local node = Terminal:new({ cmd = "node", hidden = true })
	function _NODE_TOGGLE()
		node:toggle()
	end

	-- local dust = Terminal:new({ cmd = "dust", hidden = true })
	-- function _DUST_TOGGLE()
	-- 	dust:toggle()
	-- end

	local btop = Terminal:new({ cmd = "btop", hidden = true })
	function _BTOP_TOGGLE()
		btop:toggle()
	end

	local ctop = Terminal:new({ cmd = "ctop", hidden = true })
	function _CTOP_TOGGLE()
		ctop:toggle()
	end

	local python = Terminal:new({ cmd = "python", hidden = true })
	function _PYTHON_TOGGLE()
		python:toggle()
	end

	local ranger = Terminal:new({ cmd = "ranger", hidden = true })
	function _RANGER_TOGGLE()
		ranger:toggle()
	end

	-- Tokei
	local project_info = Terminal:new({
		cmd = "tokei",
		dir = "git_dir",
		hidden = true,
		direction = "float",
		float_opts = {
			border = "double",
		},
		close_on_exit = false,
	})

	function _PROJECT_INFO_TOGGLE()
		project_info:toggle()
	end
end

return M
