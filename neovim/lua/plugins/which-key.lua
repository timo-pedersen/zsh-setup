return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 1000 
    end,
    opts = {
         -- This is the setting that controls the VISUAL popup delay
        delay = 1000, 
        
        -- Other settings...
        defaults = {
             -- Uses your existing keymaps automatically!
        }
    }
}
