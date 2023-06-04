local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
		{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
		"windwp/nvim-ts-autotag",
		"HiPhish/nvim-ts-rainbow2",
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")
	-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- 	underline = true,
	-- 	virtual_text = {
	-- 		spacing = 5,
	-- 		severity_limit = "Warning",
	-- 	},
	-- 	update_in_insert = true,
	-- })
	configs.setup({
		ensure_installed = {
			"vim",
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"c",
			-- "help",
			"gitignore",
			"markdown",
			"markdown_inline",
			"dockerfile",
			"yaml",
			"go",
			"json",
			"proto",
			"org",
			"regex",
			"query",
			"rust",
			"python",
			"dockerfile",
			"terraform",
			"toml",
      "sql",
		}, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
			-- additional_vim_regex_highlighting = false,
			additional_vim_regex_highlighting = { "org", "markdown" },
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = true, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		autotag = {
			enable = true,
			-- filetypes = { "xml" },
		},
		rainbow = {
			enable = true,
			-- list of languages you want to disable the plugin for
			disable = { "jsx", "cpp" },
			-- Which query to use for finding delimiters
			query = "rainbow-parens",
			-- Highlight the entire buffer all at once
			strategy = require("ts-rainbow").strategy.global,
		},
		-- incremental_selection = {
		-- 	enable = true,
		-- 	keymaps = {
		-- 		init_selection = "<CR>",
		-- 		scope_incremental = "<CR>",
		-- 		node_incremental = "<TAB>",
		-- 		node_decremental = "<S-TAB>",
		-- 	},
		-- },
		-- endwise = {
		-- 	enable = true,
		-- },
		-- textobjects = {
		-- 	select = {
		-- 		enable = true,
		-- 		-- Automatically jump forward to textobj, similar to targets.vim
		-- 		lookahead = true,
		-- 		keymaps = {
		-- 			-- You can use the capture groups defined in textobjects.scm
		-- 			["af"] = "@function.outer",
		-- 			["if"] = "@function.inner",
		-- 			["ac"] = "@class.outer",
		-- 			["ic"] = "@class.inner",
		-- 			["al"] = "@loop.outer",
		-- 			["il"] = "@loop.inner",
		-- 			["ib"] = "@block.inner",
		-- 			["ab"] = "@block.outer",
		-- 			["ir"] = "@parameter.inner",
		-- 			["ar"] = "@parameter.outer",
		-- 		},
		-- 	},
		-- },
	})
end

return M
