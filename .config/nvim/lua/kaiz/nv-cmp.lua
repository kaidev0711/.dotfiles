local M = {
	"hrsh7th/nvim-cmp",
	commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			"hrsh7th/cmp-buffer",
		},
		{
			"hrsh7th/cmp-path",
		},
		{
			"hrsh7th/cmp-cmdline",
		},
		{
			"saadparwaiz1/cmp_luasnip",
		},
		{
			"hrsh7th/cmp-emoji",
		},
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		{
			"hrsh7th/cmp-nvim-lua",
		},
	},

	event = {
		"InsertEnter",
		"CmdlineEnter",
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local compare = require("cmp.config.compare")
	-- local check_backspace = function()
	-- 	local col = vim.fn.col(".") - 1
	-- 	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	-- end
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local kind_icons = {
		Text = "󰉿",
		Method = "m",
		Function = "󰊕",
		Constructor = "",
		Field = "",
		Variable = "󰆧",
		Class = "󰌗",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰇽",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰊄",
		Codeium = "󰚩",
		Copilot = "",
	}

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
			-- ["<C-k>"] = cmp.mapping.select_prev_item(),
			-- ["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-j>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
			["<C-k>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
			-- ["<Tab>"] = cmp.mapping(function(fallback)
			-- 	if cmp.visible() then
			-- 		cmp.select_next_item()
			-- 	elseif luasnip.expandable() then
			-- 		luasnip.expand()
			-- 	elseif luasnip.expand_or_jumpable() then
			-- 		luasnip.expand_or_jump()
			-- 	elseif check_backspace() then
			-- 		fallback()
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, {
			-- 	"i",
			-- 	"s",
			-- }),
			-- ["<S-Tab>"] = cmp.mapping(function(fallback)
			-- 	if cmp.visible() then
			-- 		cmp.select_prev_item()
			-- 	elseif luasnip.jumpable(-1) then
			-- 		luasnip.jump(-1)
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, {
			-- 	"i",
			-- 	"s",
			-- }),
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = kind_icons[vim_item.kind]
				-- cmp-tabnine
				if entry.source.name == "cmp_tabnine" then
					vim_item.kind = ""
					vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#6CC644" })
				end
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					cmp_tabnine = "[T9]",
					nvim_lua = "[Lua]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
					emoji = "[Emoji]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = {
			-- { name = "nvim_lsp",    priority = 8 },
			-- { name = "cmp_tabnine", priority = 8, max_item_count = 3 },
			-- { name = "nvim_lua",    priority = 5 },
			-- { name = "luasnip",     priority = 5 },
			-- { name = "buffer",      priority = 7, keyword_length = 5 },
			-- { name = "path",        priority = 4 },
			-- { name = "emoji",       priority = 4 },
			-- { name = "neorg" },
			{ name = "nvim_lsp", group_index = 1 },
			-- { name = "cmp_tabnine", group_index = 1 },
			{ name = "cmp_tabnine", group_index = 1 },
			{ name = "nvim_lua", group_index = 1 },
			{ name = "luasnip", group_index = 1 },
			{ name = "buffer", group_index = 2 },
			{ name = "path", group_index = 2 },
			{ name = "emoji", group_index = 2 },
			{ name = "orgmode", group_index = 2 },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = true,
		},
		-- cmp-tabnine
		sorting = {
			priority_weight = 2,
			comparators = {
				-- require("cmp_tabnine.compare"),
				compare.offset,
				compare.exact,
				compare.score,
				compare.recently_used,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
			},
		},
	})
	local prefetch = vim.api.nvim_create_augroup("prefetch", { clear = true })

	vim.api.nvim_create_autocmd("BufRead", {
		group = prefetch,
		pattern = "*.go",
		callback = function()
			require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
		end,
	})
end

return M
