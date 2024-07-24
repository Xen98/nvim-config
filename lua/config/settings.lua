vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local map = vim.api.nvim_set_keymap

-- Configuración para copiar al portapapeles
map('v', '<Leader>y', '"+y', { noremap = true, silent = true })

-- Configuración para pegar desde el portapapeles
map('n', '<Leader>p', '"+gP', { noremap = true, silent = true })

map('n', '<leader>i', ':lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})<CR>', { noremap = true, silent = true })
