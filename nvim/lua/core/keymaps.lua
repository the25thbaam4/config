vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]


vim.cmd [[set clipboard+=unnamedplus]]


--Line numbers
vim.wo.number = true
vim.o.relativenumber = true


-- complitions
vim.o.wildmenu = true
vim.o.wildmode = "full"

-- Enable file name completion
vim.o.completeopt = vim.o.completeopt .. ",menuone,noselect"



