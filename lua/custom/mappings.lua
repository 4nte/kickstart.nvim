local keymap = vim.keymap

keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")

keymap.set("i", "jk", "<ESC>")
keymap.set("n", ";", ":")

keymap.set("n", "<leader>lm", function()
	require("telescope.builtin").lsp_document_symbols({ symbols = { "method", "function" } })
end, opts)
