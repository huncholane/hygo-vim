return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = "/home/huncho/anaconda3/bin/python",
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
