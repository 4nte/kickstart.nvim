-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
--

vim.cmd([[
    command! NeotestSummary lua require("neotest").summary.toggle()
    command! NeotestFile lua require("neotest").run.run(vim.fn.expand("%"))
    command! Neotest lua require("neotest").run.run(vim.fn.getcwd())
    command! NeotestNearest lua require("neotest").run.run()
    command! NeotestDebug lua require("neotest").run.run({ strategy = "dap" })
    command! NeotestAttach lua require("neotest").run.attach()
]])
vim.diagnostic.config({ virtual_text = false })
return {
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{ "terrastruct/d2-vim",   ft = 'd2' },
	{ "nvim-neotest/nvim-nio" },
	{ 'towolf/vim-helm',      ft = 'helm' },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require('tiny-inline-diagnostic').setup()
		end
	},
	{
		"folke/ts-comments.nvim",

		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	{
		'Lilja/zellij.nvim',
		opts = {
			whichKeyEnabled = true,
		}
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
			-- Your other test adapters here
		},
		init = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
						    diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " ")
						    :gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				-- your neotest config here
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	},
	{
		'salkin-mada/openscad.nvim',
		init = function()
			require('openscad')
			vim.g.openscad_load_snippets = true
		end,
		dependencies = 'L3MON4D3/LuaSnip'
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = ":call mkdp#util#install()",
	}
}
