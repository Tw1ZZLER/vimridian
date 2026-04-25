-- Line numbers, cursorline, relative line numbers
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- Tab spacing should be 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Treesitter folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
