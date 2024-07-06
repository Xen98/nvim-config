vim.o.number = true
vim.o.relativenumber = true
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local map = vim.api.nvim_set_keymap

map('v', '<S-y>', '"+y', {noremap = true, silent = false})
map('n', '<S-y>', '"+gP', {noremap = true, silent = false})
