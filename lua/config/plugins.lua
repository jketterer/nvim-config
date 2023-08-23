local plugins = {
    { "fladson/vim-kitty" },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        opts = {
            contrast = "soft",
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<CMD>NeoTreeFocus<CR>", desc = "Open Neotree" },
            { "<leader>E", "<CMD>NeoTreeClose<CR>", desc = "Close Neotree" },
        },
        config = true,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        opts = {
            extensions = { "ui-select", "flutter" }
        },
        config = function(_, opts)
            require("telescope").load_extension("ui-select")
			require("telescope").load_extension("flutter")
            require("telescope").setup(opts)
        end,
    },
    {
        "ggandor/leap.nvim",
        dependencies = "tpope/vim-repeat",
        keys = {
            { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S",  mode = { "n", "x", "o" }, desc = "Leap backwards to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from window" },
        },
        config = function()
            require("leap").add_default_mappings(true)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = true,
    },
    {
        "terrortylor/nvim-comment",
        keys = {
            { "<C-/>",   "<cmd>CommentToggle<cr>" },
            { "<C-S-/>", "<cmd>CommentToggle<cr>j" },
            { "<C-/>",   "<C-\\><C-N><cmd>CommentToggle<cr>i",  mode = { "i" } },
            { "<C-S-/>", "<C-\\><C-N><cmd>CommentToggle<cr>ji", mode = { "i" } },
        },
        main = "nvim_comment",
        config = true,
    },

    {
        "m4xshen/autoclose.nvim",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requirements = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = true,
    },
    {
        "akinsho/flutter-tools.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = false,
        config = true,
    },
    {
        "nmac427/guess-indent.nvim",
        config = true,
    },
    {
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
                    ['<C-n'] = cmp.mapping.scroll_docs(4), -- Down
                    ['<C-Space'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
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
    },
}

-- I only want treesitter on machines with a C compiler installed
if vim.fn.executable("gcc") == 1 then
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

    table.insert(plugins, treesitter)
end

return plugins
