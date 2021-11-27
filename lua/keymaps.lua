-- easy keymaps
function noremap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function nnoremap(lhs, rhs) noremap('n', lhs, rhs) end
function tnoremap(lhs, rhs) noremap('t', lhs, rhs) end

-- window navigation
nnoremap("<Space>h", "<C-W>h")
nnoremap("<Space>j", "<C-W>j")
nnoremap("<Space>k", "<C-W>k")
nnoremap("<Space>l", "<C-W>l")

-- source lua file
nnoremap("<C-r>", ":luafile %<CR>")

-- file editing
nnoremap("<Space>w", ":w<CR>")
nnoremap("<Space>q", ":q<CR>")

-- terminal setup
-- tnoremap("<C-`>", "<
