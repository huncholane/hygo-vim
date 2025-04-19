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

-- Vim config keymaps
vim.keymap.set("n", "<leader>v", "", { desc = "Vim Config" })
vim.keymap.set("n", "<leader>vk", function()
  vim.cmd("e ~/.config/nvim/lua/config/keymaps.lua")
end, { desc = "Edit Keymaps" })
vim.keymap.set("n", "<leader>vo", function()
  vim.cmd("e ~/.config/nvim/lua/config/options.lua")
end, { desc = "Edit Options" })
vim.keymap.set("n", "<leader>vp", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config") .. "/lua/plugins",
  })
end, { desc = "Browse Plugins" })
vim.keymap.set("n", "<leader>vs", function()
  local filename = vim.api.nvim_buf_get_name(0)
  vim.notify("Source " .. filename)
  vim.cmd("silent! write")
  vim.cmd.source(filename)
end, { desc = "Source Current File (:so %)" })
