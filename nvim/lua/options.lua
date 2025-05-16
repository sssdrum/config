local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- set column marker at 80 chars
opt.colorcolumn = "80"

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

-- clipboard
opt.clipboard:append("unnamedplus")

vim.cmd.colorscheme("monokai-pro")
