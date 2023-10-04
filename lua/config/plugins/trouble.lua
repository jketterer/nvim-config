local plugin = {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>da", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Show all" },
        { "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfixes" },
        { "<leader>gr", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
    },
    opts = {},
}

return plugin
