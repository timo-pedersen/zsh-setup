return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- Only start saving when you actually open a file
  opts = {
      dir = vim.fn.stdpath("state") .. "/sessions",
      -- Which parts of the session to save
      options = {
          "buffers",
          "curdir",
          "tabpages",
          "winsize",
        },
  },
  keys = {
    -- restore the session for the current directory
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    -- restore the last session you had open (even if in a different dir)
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    -- stop Persistence => session won't be saved on exit
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
