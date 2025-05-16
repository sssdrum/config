require("config.lazy")
require("options")
require("remaps")

-- Load common LSP settings
require("lsp.common").setup()

-- Configure LSPs
vim.lsp.config["luals"] = require("lsp.luals")
vim.lsp.config["bashls"] = require("lsp.bashls")

-- Enable the servers
vim.lsp.enable("luals")
vim.lsp.enable("bashls")
