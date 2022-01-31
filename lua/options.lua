-- enable number colum
vim.wo.number = true

-- more natural splits
vim.o.splitbelow = true
vim.o.splitright = true

-- relative number
vim.o.relativenumber = true

-- indentation config
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- lsp config
vim.o.completeopt = { "menuone", "noselect" }

-- do not create backup files
vim.o.backup = false

-- search config
vim.o.hlsearch = true
vim.o.ignorecase = true

-- do not create swap files
vim.o.swapfile = false

-- mouse config
vim.o.mouse = "a"
