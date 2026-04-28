local keymap = vim.keymap

keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")

keymap.set("i", "jk", "<ESC>")
keymap.set("n", ";", ":")

keymap.set("n", "<leader>lm", function()
	require("telescope.builtin").lsp_document_symbols({ symbols = { "method", "function" } })
end, opts)

keymap.set("n", "<leader>iv", function()
	local file = vim.fn.expand("%:p")
	if file == "" or vim.fn.filereadable(file) == 0 then
		vim.notify("No file to view", vim.log.levels.WARN)
		return
	end
	vim.fn.jobstart({ "xdg-open", file }, { detach = true })
end, { desc = "[I]mage [V]iew (external)" })
