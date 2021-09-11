call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mfussenegger/nvim-jdtls'

Plug 'ryanoasis/vim-devicons'

call plug#end()
 
" General setup
let mapleader = " "
set number
set splitbelow
set splitright
set autowrite
set relativenumber

nnoremap <leader>s :w<CR>
nnoremap <leader>W :wa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <leader>e :e

lua << EOF
  local nvim_lsp = require('lspconfig')
  local lsp_saga = require('lspsaga')
  local cmp = require('cmp')

  lsp_saga.init_lsp_saga()

  nvim_lsp.pyright.setup{}
  nvim_lsp.clangd.setup{}
  nvim_lsp.texlab.setup{}
  nvim_lsp.rust_analyzer.setup{}
EOF

" LSP setup
" nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" LSPSaga setup
nnoremap <silent> <leader>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>gd :Lspsaga preview_definition<CR>

" Color scheme setup
set background=dark

if has("termguicolors")
  set termguicolors
endif

colorscheme nord

" lightline setup
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }

" Navigation setup
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L

nnoremap <leader>fp :prev<CR>
nnoremap <leader>fn :n<CR>
nnoremap <leader>fa :args<CR>

" Terminal setup
tnoremap <Esc> <C-\><C-n>

tnoremap <C-Space>h <C-\><C-N><C-w>h
tnoremap <C-Space>j <C-\><C-N><C-w>j
tnoremap <C-Space>k <C-\><C-N><C-w>k
tnoremap <C-Space>l <C-\><C-N><C-w>l
inoremap <C-Space>h <C-\><C-N><C-w>h
inoremap <C-Space>j <C-\><C-N><C-w>j
inoremap <C-Space>k <C-\><C-N><C-w>k
inoremap <C-Space>l <C-\><C-N><C-w>l
nnoremap <C-Space>h <C-w>h
nnoremap <C-Space>j <C-w>j
nnoremap <C-Space>k <C-w>k
nnoremap <C-Space>l <C-w>l

autocmd Bufenter term://* startinsert
autocmd TermOpen * setlocal nonumber norelativenumber

" " NERDTree setup
" let g:NERDTreeDirArrowExpandable = '-'
" let g:NERDTreeDirArrowCollapsible = '|'
" 
" nnoremap <Leader>tF :NERDTreeFocus<CR>
" nnoremap <Leader>tn :NERDTree<CR>
" nnoremap <Leader>tt :NERDTreeToggle<CR>
" nnoremap <Leader>tf :NERDTreeFind<CR>
