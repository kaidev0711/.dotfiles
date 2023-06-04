local M = {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install && git reset --hard",
}
return M
