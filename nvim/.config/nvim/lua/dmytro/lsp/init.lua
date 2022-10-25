local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "dmytro.lsp.mason"
require("dmytro.lsp.handlers").setup()
require "dmytro.lsp.null-ls"
