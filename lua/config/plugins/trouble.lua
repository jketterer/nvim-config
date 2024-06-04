local plugin = {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>da", "<cmd>Trouble diagnostics toggle<cr>", desc = "Show all" },
        { "<leader>dq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfixes" },
        { "<leader>gr", "<cmd>Trouble lsp toggle win.position=right<cr>", desc = "References" },
    },
    opts = {},
}

return plugin
