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
                },
            },
        }
        require("telescope").load_extension("flutter")
    end
}

return flutter
