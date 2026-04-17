return {
	'nvim-java/nvim-java',
	dependencies = {
		'nvim-java/lua-async-await',
		'nvim-java/nvim-java-test',
		'nvim-java/nvim-java-dap',
		'MunifTanjim/nui.nvim',
		'neovim/nvim-lspconfig',
		'mfussenegger/nvim-dap',
		{
			'JavaHello/spring-boot.nvim',
			commit = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
		},
		{
			'williamboman/mason.nvim',
		},
	},
	config = function()
		require('java').setup()

		-- Add formatting settings and on_attach to jdtls
		local current_config = vim.lsp.config.jdtls or {}
		current_config.settings = vim.tbl_deep_extend('force', current_config.settings or {}, {
			java = {
				format = {
					enabled = true,
				},
			},
		})

		-- Add on_attach for keymaps, Format command and auto-format on save
		current_config.on_attach = function(client, bufnr)
			local nmap = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
			end

			-- LSP keymaps (same as init.lua on_attach)
			nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
			nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
			nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
			nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
			nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
			nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
			nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
			nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

			-- Format command
			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
				vim.lsp.buf.format()
			end, { desc = 'Format current buffer with LSP' })

			-- Auto-format on save
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end

		vim.lsp.config('jdtls', current_config)
		vim.lsp.enable('jdtls')
	end,
}
