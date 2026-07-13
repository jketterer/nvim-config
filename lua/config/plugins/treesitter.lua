-- The main branch builds parsers from source, so it requires the tree-sitter
-- CLI (>= 0.26.1, installed via your system package manager, not npm) plus a C
-- compiler on PATH. On Arch/CachyOS: sudo pacman -S tree-sitter-cli.
local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- The main branch does not support lazy-loading and rebuilds parsers on update.
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Install parsers (async; a no-op if already present).
        require("nvim-treesitter").install({ "lua" })

        -- Highlighting is no longer automatic on the main branch. Start it per
        -- buffer for any filetype that has a parser installed; pcall keeps
        -- filetypes without a parser from erroring.
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("TreesitterHighlight", {}),
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}

return treesitter
