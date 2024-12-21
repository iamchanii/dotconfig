return {
  "elentok/format-on-save.nvim",
  config = function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")

    format_on_save.setup({
      exclude_path_patterns = {
        "/node_modules/",
      },
      formatter_by_ft = {
        javascript = formatters.lsp,
        typescript = formatters.lsp,
        typescriptreact = formatters.lsp,
      },
    })
  end,
}
