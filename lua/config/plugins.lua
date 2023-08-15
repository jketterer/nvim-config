local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua" },
				highlight = { enable = true },
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		opts = {
			contrast = "soft",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>e", "<CMD>NeoTreeFocus<CR>", desc = "Open Neotree" },
			{ "<leader>E", "<CMD>NeoTreeClose<CR>", desc = "Close Neotree" },
		},
		config = true,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"ggandor/leap.nvim",
		dependencies = "tpope/vim-repeat",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backwards to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from window" },
		},
		config = function()
			require("leap").add_default_mappings(true)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = true,
	},
	{
		"terrortylor/nvim-comment",
		keys = {
			{ "<C-/>", "<cmd>CommentToggle<cr>" },
			{ "<C-S-/>", "<cmd>CommentToggle<cr>j" },
			{ "<C-/>", "<C-\\><C-N><cmd>CommentToggle<cr>i", mode = { "i" } },
			{ "<C-S-/>", "<C-\\><C-N><cmd>CommentToggle<cr>ji", mode = { "i" } },
		},
		main = "nvim_comment",
		config = true,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
				-- Autoformat files
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"fladson/vim-kitty",
	},
}

return plugins
