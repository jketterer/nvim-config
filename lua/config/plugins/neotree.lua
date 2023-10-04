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
    config = true,
}

return neotree;
