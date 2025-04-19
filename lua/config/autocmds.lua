-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local general = vim.api.nvim_create_augroup("autosave_group", { clear = true })

-- autosave on focus lost and buffer change
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "CmdlineEnter", "QuitPre" }, {
  group = general,
  callback = function(opts)
    if vim.bo.modifiable and not vim.bo.readonly and vim.bo.modified then
      local file = vim.fn.expand("%t")
      vim.cmd("silent! write")
      vim.cmd("LazyFormat")
      vim.notify("Autosaved " .. file .. "\nSource " .. opts.event)
    end
  end,
})

-- stop making comments on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general,
  desc = "Disable New Line Comment",
})

-- disable mouse on enter
local mouse = vim.opt.mouse
vim.api.nvim_create_autocmd("FocusGained", {
  group = general,
  callback = function()
    vim.opt.mouse = mouse
  end,
})
vim.api.nvim_create_autocmd("FocusLost", {
  group = general,
  callback = function()
    vim.opt.mouse = ""
  end,
})
