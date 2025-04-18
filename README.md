# Hygo Vim
If you use vim style coding in any editor, this will help you instantly convert to neovim.

## Prerequisites
- If you are using a mac, you need to use iterm2. The default terminal doesn't support true color, so 
all the colorschemes will look terrible and unreadable.
- Install a [NerdFont Font](https://www.nerdfonts.com/font-downloads)
- [FD-Find]()
```
sudo apt install fd-find
```
- [repgrep](https://github.com/BurntSushi/ripgrep)
```
sudo apt install ripgrep
```

## Steps
1. Install Neovim
    - Download for linux
```
curl -L -o ~/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage
```
2. Add this to bashrc
```
alias nvim='~/nvim.appimage'
alias nv=nvim
alias vim=nvim
```
3. Backup neovim config
```
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
4. Add a starter kit
- [LazyVim Starter](https://www.lazyvim.org/installation)
```
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```
5. Add crazy features by using `:LazyExtras`

## Setup toggle term `~/.config/nvim/lua/plugins/toggleterm.lua`
```
return {
  "akinsho/toggleterm.nvim",
  keys = {
    -- Creates name group for which-key
    {
      "<leader>t",
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
    open_mapping = [[<c-\>]],
  },
}
```

## Setup autosave `~/.config/nvim/lua/config/autocmds.lua`
- Add this to autocmd
```
-- autosave on focus lost and buffer change
local group = vim.api.nvim_create_augroup("autosave_group", { clear = true })
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = group,
  callback = function(opts)
    if vim.bo.modifiable and not vim.bo.readonly and vim.bo.modified then
      local file = vim.fn.expand("%t")
      vim.cmd("silent! write")
      vim.notify("Autosaved " .. file .. "\nSource " .. opts.event)
    end
  end,
})
```

## Vim In Your Browser `~/.config/nvim/lua/plugins/firenvim.lua`
```
return {
  -- enable firenvim
  {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    config = function()
      if vim.g.started_by_firenvim then
        vim.cmd("colorscheme tokyonight-day")
      end
      vim.g.firenvim_config = {
        globalSettings = { alt = "all" },
        localSettings = {
          [".*"] = {
            takeover = "never",
          },
        },
      }
    end,
  },
  -- disable extnsions based on firenvim
  {
    "folke/noice.nvim",
    enabled = not vim.g.started_by_firenvim,
  },
}
```
```

