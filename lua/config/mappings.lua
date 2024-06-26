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

-- Diagnostics
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open float" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.goto_prev, { desc = "Go to previous" })
