return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    
    -- "opts" will be passed to require("lualine").setup() automatically
    opts = {
        options = {
            icons_enabled = true,
            theme = "ayu",
            -- Your custom separators for that "powerline" look
            component_separators = { left = "", right = "" },
            section_separators   = { left = "", right = "" },
        },
        sections = {
            -- Left side
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            
            -- Right side
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
