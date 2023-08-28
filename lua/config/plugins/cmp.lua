local cmp = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "dcampos/nvim-snippy",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-n'] = cmp.mapping.scroll_docs(4),  -- Down
                ['<Tab>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true, -- accept first item if none selected
                },
            }),
            snippet = {
                expand = function(args)
                    require("snippy").expand_snippet(args.body)
                end
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "snippy" },
            },
        })
    end
}

return cmp;
