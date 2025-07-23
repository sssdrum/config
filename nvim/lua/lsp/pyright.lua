local common = require("lsp.common")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  on_attach = common.on_attach,
  capabilities = capabilities,
}
