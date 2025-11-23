return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    -- Lazy load: Plugin won't load until you press one of these keys
    keys = {
        {
            "<leader>ff",
            function() require("telescope.builtin").find_files() end,
            desc = "Telescope: Find files",
        },
        {
            "<leader>fg",
            function() require("telescope.builtin").live_grep({
                additional_args = function() return { "--hidden" } end,
            }) end,
            desc = "Telescope: Live grep",
        },

        {
            "<leader>fb",
            function() require("telescope.builtin").buffers() end,
            desc = "Telescope: Buffers",
        },
        {
            "<leader>fh",
            function() require("telescope.builtin").help_tags() end,
            desc = "Telescope: Help tags",
        },
        {
            "<leader>fr",
            function() require("telescope.builtin").oldfiles() end,
            desc = "Telescope: Recent files",
        },

    },
    
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = {
                    prompt_position = "top", -- Search bar at the top (modern feel)
                },
                sorting_strategy = "ascending",
                
                prompt_prefix = "  ",
                selection_caret = " ",
                path_display = { "smart" },

                -- The ".NET / Enterprise" ignore list
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "%.vs/",        -- Visual Studio metadata
                    "%.vscode/",        -- Visual Studio Code metadata
                    "%.idea/",      -- JetBrains metadata
                    "bin/",         -- .NET build artifacts
                    "obj/",         -- .NET intermediates
                    "packages/",    -- Nuget packages
                    "%.zip",
                    "%.dll",
                    "%.pdb",
                    "%.exe",
                },

                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                    },
                },

            },

            pickers = {
                buffers = {
                    sort_lastused = true,
                    ignore_current_buffer = true,
                    previewer = false,
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },

        })

        -- Load fzf extension for speed
        pcall(telescope.load_extension, "fzf")
    end,
}
