local flutter = {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
    keys = {
        { "<leader>tf", "<cmd>Telescope flutter commands<cr>", desc = "Flutter" },
    },
    config = function()
        require("flutter-tools").setup {
            lsp = {
                settings = {
                    renameFilesWithClasses = "always",
                    updateImportsOnRename = "true",
                },
            },
        }

        require("telescope").load_extension("flutter")

        -- TODO: does this work?
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*.dart" },
            callback = function()
                vim.keymap.set("n", "<leader>cr", "<cmd>FlutterRename<cr>")
            end,
        })
    end
}

return flutter
