local keys = {
    { "<leader>c",  group = "code" },
    { "<leader>d",  group = "diagnostics" },
    { "<leader>f",  group = "find" },
    { "<leader>g",  group = "goto" },
    { "<leader>h",  group = "harpoon" },
    { "<leader>t",  group = "tools" },
    { "<leader>tl", "<cmd>Lazy<cr>",      desc = "lazy.nvim", mode = "n" },
}

local plugin = {
    "folke/which-key.nvim",
    opts = {
        spec = keys,
    },
    config = function(_, opts)
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup(opts)
    end,
}

return plugin
