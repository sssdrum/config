require("config.lazy")
require("options")
require("remaps")

-- Load common LSP settings
require("lsp.common").setup()

-- Configure LSPs
vim.lsp.config["luals"] = require("lsp.luals")
vim.lsp.config["bashls"] = require("lsp.bashls")
vim.lsp.config["tstools"] = require("lsp.tstools")
vim.lsp.config["gopls"] = require("lsp.gopls")

-- Enable the servers
vim.lsp.enable("luals")
vim.lsp.enable("bashls")
vim.lsp.enable("tstools")
vim.lsp.enable("gopls")
