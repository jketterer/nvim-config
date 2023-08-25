require("config.options")
require("config.mappings")

-- [[ PLUGIN LOADER ]]
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

local plugins = require("config.plugins.list")
require("lazy").setup(plugins)

require("config.which")
require("config.colorscheme")
require("config.lsp")
