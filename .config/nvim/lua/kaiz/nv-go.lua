local M = {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}

function M.config()
	require("go").setup()
	-- local go = require("go")
	-- go.setup({
	-- 	-- notify: use nvim-notify
	-- 	notify = false,
	-- 	-- auto commands
	-- 	auto_format = false,
	-- 	auto_lint = true,
	-- 	-- lint_prompt_style: qf (quickfix), vt (virtual text)
	-- 	lint_prompt_style = "vt",
	-- 	-- linters: revive, errcheck, staticcheck, golangci-lint
	-- 	linter = "revive",
	-- 	-- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
	-- 	-- formatter: goimports, gofmt, gofumpt, lsp
	-- 	formatter = "gofmt",
	-- })
	-- go.config.update_tool("quicktype", function(tool)
	-- 	tool.pkg_mgr = "yarn"
	-- end)
end

return M
