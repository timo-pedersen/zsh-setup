return {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
        -- Toggle Spectre UI
        {
            "<leader>S",
            function() require("spectre").toggle() end,
            desc = "Spectre: Toggle UI",
        },

        -- Search word (normal mode)
        {
            "<leader>sw",
            function()
                require("spectre").open({
                    select_word = true,
                })
            end,
            desc = "Spectre: Search current word",
        },

        -- Search in current file only
        {
            "<leader>sp",
            function()
                require("spectre").open_file_search({
                    select_word = true,
                })
            end,
            desc = "Spectre: Search in current file",
        },

        -- Open Spectre project-wide UI (empty, do your own query)
        {
            "<leader>sr",
            function() require("spectre").open() end,
            desc = "Spectre: Search/Replace",
        },
    },

    opts = {
        -- You can specify ripgrep explicitly
        find_engine = {
            ["rg"] = {
                cmd = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--hidden",                 },
            },
        },
        default = {
            find = { cmd = "rg" },
        },
    },
}

