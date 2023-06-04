local M = {
	"jayp0521/mason-null-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
}
function M.config()
	local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
	if not status_ok then
		return
	end
	mason_null_ls.setup({
		ensure_installed = {
			-- Opt to list sources here, when available in mason.
			"ruff",
		},
		automatic_setup = true,
		handlers = {},
	})
end

return M
