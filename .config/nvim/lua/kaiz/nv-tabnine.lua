local M = {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",
}
function M.config()
  local tabnine = require("cmp_tabnine.config")

  tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = {
      -- lua = true
    },
    show_prediction_strength = false,
  })
end

return M
