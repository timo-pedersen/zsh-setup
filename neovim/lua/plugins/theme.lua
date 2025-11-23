return {
    "folke/tokyonight.nvim",
    lazy = false, -- Load immediately (don't lazy load the theme)
    priority = 1000, -- Load before everything else so the UI doesn't flash

    opts = {
        style = "moon",
        transparent = false,

        terminal_colors = true,
        dim_inactive = true,

        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true },
            variables = {},
       },

        plugins = {
            gitsigns = true,
            telescope = true,
            lualine = true,
        },

        on_highlights = function(hl, c)
            -- Interface names (C#)
            hl["@type.interface"] = { fg = c.cyan, italic = true }

            -- Parameters (C#, JS, Lua, etc.)
            hl["@variable.parameter"] = { fg = c.orange }

            -- Optional extra C# polish:
            -- hl["@namespace"] = { fg = c.blue }
            -- hl["@constructor"] = { fg = c.yellow }
        end,
    },

    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight")
    end,
}
