return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        relay_lsp = {},
      },
    },
    setup = {
      relay_lsp = {
        auto_start_compiler = false,
      },
    },
  },
}
