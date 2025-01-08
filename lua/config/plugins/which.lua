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
    dependencies = {
        "echasnovski/mini.nvim",
    },
    opts = {
        spec = keys,
    }
}

return plugin
