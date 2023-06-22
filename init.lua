-- [[ OPTIONS ]]
vim.o.termguicolors = true
vim.o.syntax = "on"
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.showmode = true
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.bo.autoindent = true
vim.bo.smartindent = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.wrap = false

-- [[ MAPPINGS ]]
vim.g.mapleader = " "

local map_key = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- Arrow keys bad
map_key("", "<up>", "<nop>")
map_key("", "<down>", "<nop>")
map_key("", "<left>", "<nop>")
map_key("", "<right>", "<nop>")

-- Escape key is hard
map_key("i", "kj", "<ESC>")
map_key("v", "kj", "<ESC>")

-- [[ PLUGINS ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

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
			{ "<leader>e", "<CMD>Neotree toggle<CR>", desc = "Toggle Neotree" },
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

require("lazy").setup(plugins)

-- [[ COLORSCHEME ]]
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

-- [[ WHICH KEY MAPPINGS ]]
require("which-key").register({
	["<leader>"] = {
		f = {
			name = "+find",
			f = { "<cmd>Telescope find_files<cr>", "Find file" },
			g = { "<cmd>Telescope live_grep<cr>", "Find text (live grep)" },
			b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
		},
	},
})
