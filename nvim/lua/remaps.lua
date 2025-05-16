-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>pv", vim.cmd.Ex) -- "n" means that this remap works while in normal mode
keymap.set("n", "<leader> ", [[:b#<CR>]]) -- opens last opened buffer
