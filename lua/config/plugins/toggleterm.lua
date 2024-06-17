local opts = {
    open_mapping = [[<leader>tt]],
    insert_mappings = false,
    hide_numbers = true, -- hide number column in terminal buffers
    autochdir = false, -- change terminal dir as neovim's current dir changes
    start_in_insert = true,
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell,
    direction = "horizontal", -- horizontal, vertical, tab, float
    auto_scroll = true,
}

local plugin = {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = opts,
}

return plugin
