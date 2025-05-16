local common = require("lsp.common")

return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  on_attach = common.on_attach,
}
