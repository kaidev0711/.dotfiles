local M = {
	"jay-babu/mason-nvim-dap.nvim",
	event = "BufRead",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
}
function M.config()
	require("mason-nvim-dap").setup {
		automatic_setup = true,
		handlers = {
			function(config)
				-- all sources with no handler get passed here

				-- Keep original functionality
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	}
end

return M
