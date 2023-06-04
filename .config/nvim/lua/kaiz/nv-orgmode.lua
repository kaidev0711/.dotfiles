return {
	{
		"nvim-orgmode/orgmode",
		enabled = true,
		ft = { "org" },
		opts = {
			org_agenda_files = { "~/org/*.org" },
			org_default_notes_file = "~/org/kaiz.org",
			ui = {
				menu = {
					handler = function(data)
						-- your handler here, for example:
						local options = {}
						local options_by_label = {}

						for _, item in ipairs(data.items) do
							-- Only MenuOption has `key`
							-- Also we don't need `Quit` option because we can close the menu with ESC
							if item.key and item.label:lower() ~= "quit" then
								table.insert(options, item.label)
								options_by_label[item.label] = item
							end
						end

						local handler = function(choice)
							if not choice then
								return
							end

							local option = options_by_label[choice]
							if option.action then
								option.action()
							end
						end

						vim.ui.select(options, {
							propmt = data.propmt,
						}, handler)
					end,
				},
			},
		},
		config = function(plugin, opts)
			require("orgmode").setup_ts_grammar()
			require("orgmode").setup(opts)
			vim.opt.conceallevel = 2
			vim.opt.concealcursor = "nc"
      vim.opt.shellslash = true
		end,
	},
	{
		"akinsho/org-bullets.nvim",
		enabled = true,
		config = true,
		ft = { "org" },
	},
	{ "dhruvasagar/vim-table-mode", ft = { "markdown", "org" } },
	{
		"lukas-reineke/headlines.nvim",
		config = function() end,
		ft = { "markdown", "org" },
		enabled = false,
	},
}
