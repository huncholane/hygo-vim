-- https://github.com/akinsho/toggleterm.nvim
return {
  "akinsho/toggleterm.nvim",
  keys = {
    -- Creates name group for which-key
    {
      "<leader>t",
      function()
      end,
      desc = "toggleterm",
    },
    -- Creates a new floating terminal
    {
      "<leader>tf",
      "<cmd>TermNew direction=float<cr>",
      desc = "Create New Floating Terminal",
    },
    -- Creates a new tabbed terminal
    {
      "<leader>tt",
      "<cmd>TermNew direction=tab<cr>",
      desc = "Create New Tabbed Terminal",
    },
    -- Selects a terminal
    {
      "<leader>ts",
      "<cmd>TermSelect<cr>",
      desc = "Select Terminal",
    },
  },
  opts = {
    direction="float",
    open_mapping = [[<c-\>]],
    start_in_insert=true
  },
}
