local M = {
	{
		"nvimdev/lspsaga.nvim",
		event = "VeryLazy",
		-- config = true,
		opts = {
			symbol_in_winbar = {
				enable = false,
			},
		},
	},
	-- { "Bekaboo/dropbar.nvim", event = "VeryLazy" },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    enabled = function()
      return vim.fn.has "nvim-0.10.0" == 1
    end,
  },
}
return M
