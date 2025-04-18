-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- autosave on focus lost and buffer change
local group = vim.api.nvim_create_augroup("autosave_group", { clear = true })
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "CmdlineEnter" }, {
  group = group,
  callback = function(opts)
    if vim.bo.modifiable and not vim.bo.readonly and vim.bo.modified then
      local file = vim.fn.expand("%t")
      vim.cmd("silent! write")
      vim.notify("Autosaved " .. file .. "\nSource " .. opts.event)
    end
  end,
})
