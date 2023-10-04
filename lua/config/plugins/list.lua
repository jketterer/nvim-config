local plugins = {
    { "fladson/vim-kitty" },
    { "neovim/nvim-lspconfig" },
    { "m4xshen/autoclose.nvim",    config = true },
    { "RRethy/vim-illuminate" },
    { "nmac427/guess-indent.nvim", config = true },
    { "williamboman/mason.nvim",   config = true },
    {
        "ellisonleao/gruvbox.nvim",
        opts = { contrast = "soft" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = true,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    }
}

local pluginLoader = require("config.plugins.pluginloader")

pluginLoader.apply(plugins, require("config.plugins.alpha"))
pluginLoader.apply(plugins, require("config.plugins.cmp"))
pluginLoader.apply(plugins, require("config.plugins.comment"))
pluginLoader.apply(plugins, require("config.plugins.leap"))
pluginLoader.apply(plugins, require("config.plugins.neotree"))
pluginLoader.apply(plugins, require("config.plugins.notify"))
pluginLoader.apply(plugins, require("config.plugins.telescope"))

pluginLoader.applyIfCommandExists("flutter", plugins, require("config.plugins.flutter"))
pluginLoader.applyIfCommandExists("gcc", plugins, require("config.plugins.treesitter"))

return plugins
