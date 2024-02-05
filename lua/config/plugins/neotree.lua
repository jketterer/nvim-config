local neotree = {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", "<CMD>NeoTreeFocus<CR>", desc = "Open Neotree" },
        { "<leader>E", "<CMD>NeoTreeClose<CR>", desc = "Close Neotree" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                group_empty_dirs = true,
            },
        })
    end,
}

return neotree;
