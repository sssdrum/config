local common = require("lsp.common")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  on_attach = common.on_attach,
  capabilities = capabilities,
}
