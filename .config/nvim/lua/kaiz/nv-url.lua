local M = {
  "axieax/urlview.nvim",
  cmd = "UrlView",
}
function M.config()
  require("urlview").setup({})
end

return M
