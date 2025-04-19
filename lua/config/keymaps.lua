-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle markdown
vim.keymap.set("n", "<leader>ch", function()
  if vim.wo.conceallevel > 0 then
    vim.wo.conceallevel = 0
    vim.notify("Conceal ON")
  else
    vim.wo.conceallevel = 2
    vim.notify("Conceal OFF")
  end
end, { desc = "Toggle Markdown Conceal" })

-- Toggle inlay hints
vim.keymap.set({ "n", "i", "v", "x", "t" }, "<M-i>", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  if vim.lsp.inlay_hint.is_enabled() then
    vim.notify("Enabled inlay hint")
  else
    vim.notify("Disabled inlay hint")
  end
end)

-- Remove carriage
vim.keymap.set("n", "<leader>fm", function()
  vim.cmd(":%s/\r//g")
end, { desc = "Remove carriage return" })

-- lazy keymaps
-- open lazy extra
vim.keymap.set("n", "<leader>le", function()
  vim.cmd("LazyExtra")
end, { desc = "Extras" })
-- reload current file as plugin
vim.keymap.set("n", "<leader>lr", function()
  vim.cmd("silent! write")
  local file = vim.fn.expand("%:p")
  local result = dofile(file)
  local plugins = {}
  -- add plugin to table
  local function handleplugin(plugin)
    local name = plugin[1] or plugin.name
    local _, repo = (plugin[1] or plugin.name):match("([^/]+)/([^/]+)")
    if repo then
      plugin = repo
    else
      plugin = name
    end
    table.insert(plugins, plugin)
  end
  -- add all the plugins to table
  if type(result[1]) == "table" then
    for _, plugin in ipairs(result) do
      handleplugin(plugin)
    end
  else
    handleplugin(result)
  end
  -- reload each plugin
  for _, plugin in ipairs(plugins) do
    vim.cmd("Lazy reload " .. plugin)
  end
end, { desc = "Reload File Plugins" })
-- edit keymaps
vim.keymap.set("n", "<leader>lk", function()
  vim.cmd("e ~/.config/nvim/lua/config/keymaps.lua")
end, { desc = "Edit Keymaps" })
-- edit options
vim.keymap.set("n", "<leader>lo", function()
  vim.cmd("e ~/.config/nvim/lua/config/options.lua")
end, { desc = "Edit Options" })
-- telescope user defined plugins
vim.keymap.set("n", "<leader>lp", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config") .. "/lua/plugins",
  })
end, { desc = "Browse Plugins" })
-- source the current file
vim.keymap.set("n", "<leader>ls", function()
  vim.cmd("silent! write")
  local filename = vim.api.nvim_buf_get_name(0)
  vim.notify("Source " .. filename)
  vim.cmd.source(filename)
end, { desc = "Source Current File (:so %)" })
