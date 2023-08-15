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
