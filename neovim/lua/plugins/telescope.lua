return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    -- Lazy load: Plugin won't load until you press one of these keys
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope: Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope: Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope: Help tags" },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = {
                    prompt_position = "top", -- Search bar at the top (modern feel)
                },
                sorting_strategy = "ascending",
                
                -- The ".NET / Enterprise" ignore list
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "%.vs/",        -- Visual Studio metadata
                    "%.idea/",      -- JetBrains metadata
                    "bin/",         -- .NET build artifacts
                    "obj/",         -- .NET intermediates
                    "packages/",    -- Nuget packages
                    "%.zip",
                    "%.dll",
                    "%.pdb",
                    "%.exe",
                },
            },
        })

        -- Load fzf extension for speed
        pcall(telescope.load_extension, "fzf")
    end,
}
