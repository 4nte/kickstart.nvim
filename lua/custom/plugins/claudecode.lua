return {
	"coder/claudecode.nvim",
	lazy = false,
	config = function()
		require("claudecode").setup({
			-- Terminal configuration
			terminal = {
				split_side = "right",
				split_width_percentage = 0.4,
				provider = "native",
			},
		})

		-- Keymaps for Claude Code
		vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "[C]laude [C]ode toggle" })
		vim.keymap.set("v", "<leader>cs", "<cmd>ClaudeCodeSend<cr>", { desc = "[C]laude [S]end selection" })
		vim.keymap.set("n", "<leader>co", "<cmd>ClaudeCodeOpen<cr>", { desc = "[C]laude [O]pen" })
	end,
}
