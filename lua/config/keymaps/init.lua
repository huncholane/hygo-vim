-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("config.keymaps.lazy")

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
vim.keymap.set({ "n" }, "<leader>ci", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  if vim.lsp.inlay_hint.is_enabled() then
    vim.notify("Enabled inlay hint")
  else
    vim.notify("Disabled inlay hint")
  end
end)

-- Remove carriage
vim.keymap.set("n", "<leader>cu", function()
  vim.cmd(":%s/\r//g")
end, { desc = "Remove carriage return" })

-- restart lsp
vim.keymap.set("n", "<leader>cz", function()
  vim.notify("Running LspRestart")
  vim.cmd("LspRestart")
end, { desc = "Restart lsp" })
