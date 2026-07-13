local plugin = {
    "mason-org/mason.nvim",
    config = true,
    lazy = false,
    keys = {
        { "<leader>tm", "<cmd>Mason<cr>", desc = "Mason" },
    },
}

return plugin;
