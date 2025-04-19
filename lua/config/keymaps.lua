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
vim.keymap.set("n", "<leader>le", function()
  vim.cmd("LazyExtra")
end, { desc = "Extras" })
vim.keymap.set("n", "<leader>lr", function()
  local file = vim.fn.expand("%:t:r") -- current filename without extension
  require("lazy").reload("plugins." .. file)
end, { desc = "Reload Plugin" })
vim.keymap.set("n", "<leader>lk", function()
  vim.cmd("e ~/.config/nvim/lua/config/keymaps.lua")
end, { desc = "Edit Keymaps" })
vim.keymap.set("n", "<leader>lo", function()
  vim.cmd("e ~/.config/nvim/lua/config/options.lua")
end, { desc = "Edit Options" })
vim.keymap.set("n", "<leader>lp", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config") .. "/lua/plugins",
  })
end, { desc = "Browse Plugins" })
vim.keymap.set("n", "<leader>ls", function()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.notify("Source " .. filename)
  vim.cmd("silent! write")
  vim.cmd.source(filename)
end, { desc = "Source Current File (:so %)" })
