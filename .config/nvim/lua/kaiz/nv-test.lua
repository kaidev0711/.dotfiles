return {
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>stc", "<cmd>w|TestClass<cr>",   desc = "Class" },
      { "<leader>stf", "<cmd>w|TestFile<cr>",    desc = "File" },
      { "<leader>stl", "<cmd>w|TestLast<cr>",    desc = "Last" },
      { "<leader>stn",  "<cmd>w|TestNearest<cr>", desc = "Nearest" },
      { "<leader>sts",  "<cmd>w|TestSuite<cr>",   desc = "Suite" },
      { "<leader>stv",  "<cmd>w|TestVisit<cr>",   desc = "Visit" },
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "belowright"
      vim.g["test#neovim#preserve_screen"] = 1
      vim.g["test#python#runner"] = "pyunit" -- pytest
    end,
  },
  {
    "nvim-neotest/neotest",
    keys = {
      {
        "<leader>stNF",
        "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
        desc = "Debug File",
      },
      { "<leader>stnL", "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>", desc = "Debug Last" },
      { "<leader>stna", "<cmd>w|lua require('neotest').run.attach()<cr>",                     desc = "Attach" },
      { "<leader>stnf", "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>",      desc = "File" },
      { "<leader>stnl", "<cmd>w|lua require('neotest').run.run_last()<cr>",                   desc = "Last" },
      { "<leader>stnn", "<cmd>w|lua require('neotest').run.run()<cr>",                        desc = "Nearest" },
      { "<leader>stnN", "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>",      desc = "Debug Nearest" },
      { "<leader>stno", "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>",    desc = "Output" },
      { "<leader>stns", "<cmd>w|lua require('neotest').run.stop()<cr>",                       desc = "Stop" },
      { "<leader>stns", "<cmd>w|lua require('neotest').summary.toggle()<cr>",                 desc = "Summary" },
    },
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
    },
    config = function()
      local opts = {
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "unittest",
          }),
          require("neotest-plenary"),
          require("neotest-go"),
        },
        -- overseer.nvim
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
        overseer = {
          enabled = true,
          force_default = true,
        },
      }
      require("neotest").setup(opts)
    end,
  },
  {
    "stevearc/overseer.nvim",
    keys = {
      { "<leader>stoR", "<cmd>OverseerRunCmd<cr>",       desc = "Run Command" },
      { "<leader>stoa", "<cmd>OverseerTaskAction<cr>",   desc = "Task Action" },
      { "<leader>stob", "<cmd>OverseerBuild<cr>",        desc = "Build" },
      { "<leader>stoc", "<cmd>OverseerClose<cr>",        desc = "Close" },
      { "<leader>stod", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete Bundle" },
      { "<leader>stol", "<cmd>OverseerLoadBundle<cr>",   desc = "Load Bundle" },
      { "<leader>stoo", "<cmd>OverseerOpen<cr>",         desc = "Open" },
      { "<leader>stoq", "<cmd>OverseerQuickAction<cr>",  desc = "Quick Action" },
      { "<leader>stor", "<cmd>OverseerRun<cr>",          desc = "Run" },
      { "<leader>stos", "<cmd>OverseerSaveBundle<cr>",   desc = "Save Bundle" },
      { "<leader>stot", "<cmd>OverseerToggle<cr>",       desc = "Toggle" },
    },
    config = true,
  },
  -- {
  --   "andythigpen/nvim-coverage",
  --   cmd = { "Coverage" },
  --   config = true,
  -- },
}
