return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "marilari88/twoslash-queries.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local tsserver = lspconfig["tsserver"]

    tsserver.setup({
      on_attach = function(client, bufnr)
        require("twoslash-queries").attach(client, bufnr)
      end,
    })
  end,
}
