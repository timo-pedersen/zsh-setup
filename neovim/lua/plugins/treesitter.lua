return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "c",
                "cpp",
                "json",
                "xml",
                "html",
                "css",
                "c_sharp",
                "gitcommit",
                "markdown",
                "markdown_inline",
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
                -- disable = { "python", "yaml" }, -- if they annoy you
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        })
    end,
}

