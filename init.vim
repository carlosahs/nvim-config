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

lua << EOF
  local nvim_lsp = require('lspconfig')
  local lsp_saga = require('lspsaga')
  lsp_saga.init_lsp_saga()

  nvim_lsp.pyright.setup{}
  nvim_lsp.clangd.setup{}
  nvim_lsp.texlab.setup{}
EOF

" LSP setup
nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" LSPSaga setup
nnoremap <silent> <leader>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

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

" vim-vsnip setup
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
