local M = {}

-- tabs function
function M.set_tabs(length)
  vim.bo.tabstop = length
  vim.bo.shiftwidth = length
  vim.bo.softtabstop = length
  vim.bo.expandtab = true
end
vim.api.nvim_create_user_command("SetTabs", function(opts)
  local length = tonumber(opts.args)
  if length then
    M.set_tabs(length)
    vim.notify("Set tabs to " .. length)
  else
    vim.notify("Invalid number", vim.log.levels.ERROR)
  end
end, { desc = "Set tab width for current buffer." })

-- configure a language
function M.config_lang(filetype, func)
  if vim.bo.filetype == filetype then
    func()
  end
  local augroup = vim.api.nvim_create_augroup(filetype .. "Options", { clear = true })
  vim.api.nvim_create_autocmd("Filetype", {
    group = augroup,
    callback = func,
  })
end

return M
