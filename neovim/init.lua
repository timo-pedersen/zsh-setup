require("first")

require("keymappings")

-- inits
o = vim.o
bo = vim.bo
wo = vim.wo

-- basics
wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.signcolumn = 'yes'
wo.wrap = true
wo.colorcolumn = '120'

o.syntax = 'on'
o.showmode = true
o.termguicolors = true
o.errorbells = false
o.signcolumn = 'yes'
o.scrolloff = 4
o.updatetime = 50

-- tabs
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
bo.autoindent = true
bo.smartindent = true

-- search
o.ignorecase = true
o.incsearch = true
o.hlsearch = true

-- shell, bu &c
o.shell = "C:/msys64/usr/bin/bash.exe"
o.writebackup = false
o.backup = false
o.undodir = vim.fn.stdpath("data") .. "/undo"
o.undofile = true
bo.swapfile = false -- true = Swapfile will be in memory

-- buffers, windows etc
o.hidden = false -- something whether buffers are in mem or on disk. Look it up. Affects performance.

-- Syntaxt, Autocomplete
o.completeopt = 'menuone,noinsert,noselect' -- Look it up

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'ayu',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
},
-- init.lua:
{
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
}

)
