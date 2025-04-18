return {
  "kawre/leetcode.nvim",
  event="VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>z",function ()
      vim.cmd("Leet")
    end, desc = "LeetCode" },
    {
      "<leader>zt",
      function()
        vim.cmd("Leet test")
      end,
      desc = "Test",
    },
    {
      "<leader>za",
      function()
        vim.cmd("Leet submit")
      end,
      desc = "Submit",
    },
    {
      "<leader>zh",
      function()
        vim.cmd("Leet")
      end,
      desc = "Home Page",
    },
    {
      "<leader>zl",
      function()
        vim.cmd("Leet")
        vim.cmd("sleep 10m")
        vim.cmd("Leet list")
      end,
      desc = "Problem List",
    },
    {
      "<leader>zr",
      function()
        vim.cmd("Leet random")
      end,
      desc = "Random Question",
    },
    {
      "<leader>zo",
      function()
        vim.cmd("Leet open")
      end,
      desc = "Open in Browser",
    },
    {
      "<leader>zd",
      function()
        vim.cmd("Leet daily")
      end,
      desc = "Daily Question",
    },

  },
  opts = {
    lang = "golang",
  },
}
