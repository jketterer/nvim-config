local plugin = {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            desc = "Format",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
        },
        formatters = {
            -- Only format projects that opt in with a stylua.toml.
            stylua = { require_cwd = true },
        },
        format_on_save = function(bufnr)
            if vim.bo[bufnr].filetype ~= "lua" then
                return
            end
            return { timeout_ms = 500, lsp_format = "never" }
        end,
    },
}

return plugin
