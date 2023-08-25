local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua" },
            highlight = { enable = true },
        })
    end,
}

return treesitter
