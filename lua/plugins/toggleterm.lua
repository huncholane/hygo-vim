-- https://github.com/akinsho/toggleterm.nvim
return {
  "akinsho/toggleterm.nvim",
  event="VeryLazy",
  name="Toggleterm",
  keys = {
    -- Names the key group
    { "<leader>t", desc = "Toggle Terminal"},
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
    direction = "float",
    open_mapping = [[<c-\>]],
    start_in_insert = false,
    float_opts={
      border = "curved",
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
}
