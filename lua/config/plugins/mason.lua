local plugin = {
    "williamboman/mason.nvim",
    opts = {},
    lazy = false,
    keys = {
        { "<leader>tm", "<cmd>Mason<cr>", desc = "Mason" },
    },
}

return plugin;
