local telescope = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
        extensions = { "ui-select" },
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        }
    },
    config = function(_, opts)
        require("telescope").load_extension("ui-select")
        require("telescope").setup(opts)

        local t = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fb", t.buffers, { desc = "Find buffer" })
        vim.keymap.set("n", "<leader>ff", t.find_files, { desc = "Find file" })
        vim.keymap.set("n", "<leader>fg", t.live_grep, { desc = "Find text (ripgrep)" })
        vim.keymap.set("n", "<leader>fr", t.oldfiles, { desc = "Find recent file" })

        -- Colorscheme picker
        vim.keymap.set(
            "n",
            "<leader>tc",
            require("telescope.builtin").colorscheme,
            { desc = "Colorscheme" }
        )
    end,
}

return telescope
