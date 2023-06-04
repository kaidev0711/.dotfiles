return {
	"michaelb/sniprun",
	enabled = true,
	build = "zsh ./install.sh",
	opts = {
		display = { "Terminal" },
		live_display = { "VirtualTextOk", "TerminalOk" },
		selected_interpreters = { "Python3_fifo" },
		repl_enable = { "Python3_fifo" },
	},

	config = function(_, opts)
		require("sniprun").setup(opts)
	end,
  --stylua: ignore
  keys = {
    { "<leader>saa", function() require("sniprun.api").run_range(1, vim.fn.line("$")) end, desc = "All", },
    { "<leader>saC", function() require("sniprun.display").close_all() end,                desc = "Close", },
    { "<leader>sac", function() require("sniprun").run() end,                              desc = "Current" },
    { "<leader>sai", function() require("sniprun").info() end,                             desc = "Info", },
    { "<leader>sal", function() require("sniprun.live_mode").toggle() end,                 desc = "Live Mode", },
    { "<leader>sap", function() require("sniprun").clear_repl() end,                       desc = "Clear REPL", },
    { "<leader>sar", function() require("sniprun").reset() end,                            desc = "Reset", },
    {
      "<leader>sv",
      function() require("sniprun").run("v") end,
      mode = { "v" },
      desc =
      "Selection",
    },
  },
}

