-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disable completions with ai
vim.g.ai_cmp = false

-- use wsl view to open links
---@diagnostic disable-next-line
vim.ui.open = function(url)
  local cmd = { "wslview", url }
  vim.fn.jobstart(cmd, { detach = true })
end
