local KeyMaps = require("utils.keymaps")

local nnoremap = KeyMaps.nnoremap
local tnoremap = KeyMaps.tnoremap

-- window navigation
nnoremap("<Space>h", "<C-W>h")
nnoremap("<Space>j", "<C-W>j")
nnoremap("<Space>k", "<C-W>k")
nnoremap("<Space>l", "<C-W>l")

-- moving windows
nnoremap("<Space>H", "<C-W>H")
nnoremap("<Space>J", "<C-W>J")
nnoremap("<Space>K", "<C-W>K")
nnoremap("<Space>L", "<C-W>L")

-- source lua file
nnoremap("<C-r>", ":luafile %<CR>")

-- file editing
nnoremap("<Space>w", ":w<CR>")
nnoremap("<Space>q", ":q<CR>")

-- terminal setup
tnoremap("<Esc>", "<C-\\><C-N>")

tnoremap("<C-Space>h", "<C-\\><C-N><C-W>h")
tnoremap("<C-Space>j", "<C-\\><C-N><C-W>j")
tnoremap("<C-Space>k", "<C-\\><C-N><C-W>k")
tnoremap("<C-Space>l", "<C-\\><C-N><C-W>l")

nnoremap("tv", ":vs term://bash<CR>")
nnoremap("th", ":sp term://bash<CR>")
