return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- ← ADD THIS
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        options = {
            icons_enabled = true,
            theme = "tokyonight",
            component_separators = { left = "", right = "" },
            section_separators   = { left = "", right = "" },
            globalstatus = true,   -- modern UI (Neovim 0.9+)
            disabled_filetypes = { statusline = { "alpha", "dashboard" } },
        },

        sections = {
            lualine_a = { "mode" },

            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    symbols = {
                        error = " ",
                        warn  = " ",
                        info  = " ",
                        hint  = "󰌵 ",
                    },
                },
            },

            -- Show file path relative to project root
            lualine_c = {
                { "filename", path = 1, symbols = { modified = " ", readonly = " " } },
            },

            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}

