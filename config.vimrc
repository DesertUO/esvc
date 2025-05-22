set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set splitright
set completeopt+=preview

set termguicolors

call plug#begin('~/.vim/plugged')

" COLORSCHEME
Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim'
" STATUSLINE
Plug 'vim-airline/vim-airline'

" LSP AND SNIPPETS

" LSP support
"Plug 'prabirshrestha/vim-lsp'


" SNIPPETS
" Snippet plugin
" Plug 'hrsh7th/vim-vsnip'

" Snippet collection
" Plug 'vim-vsnip/vsnip-snippets'

" AUTOCOMPLETION

" Autocompletion framework
"Plug 'prabirshrestha/asyncomplete.vim'

" LSP source for autocompletion
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

" SNIPPETS
"

" LSP support for Vim
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Autocompletion plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }

" Snippet engine
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'

" SYNTAX HIGHLIGHTING
Plug 'sheerun/vim-polyglot'

" Tree file explorer/manager
Plug 'preservim/nerdtree'

" ...

call plug#end()

" Config COLORSCHEME
colorscheme catppuccin_mocha
" colorscheme gruvbox
" set background=dark

let g:gruvbox_transparent_bg = '1'

hi NORMAL ctermbg=NONE
hi NonText ctermbg=NONE
" hi NORMAL guibg=NONE

hi vertsplit ctermbg=NONE

" LSP server config
" let g:lsp_settings = {
" 	\ 'clangd': {'cmd': ['clangd']},
" 	\}

" Key mappings for LSP actions
" nnoremap gd <Plug>(lsp-definition)
" nnoremap gr <Plug>(lsp-references)
" nnoremap gi <Plug>(lsp-implementation)
" nnoremap K <Plug>(lsp-hover)
" nnoremap <leader>rn <Plug>(lsp-rename)
" nnoremap <leader>ca <Plug>(lsp-code-action)

" let g:vsnip_snippet_dir = '~/.vim/snippets'

" Defining a directory for custom snippets
" let g:neosnippet#snippet_directory = ~/.vim/snippets

" Enable LSP

" Key mappings for LSP actions
autocmd User lsp_setup call s:lsp_mappings()

function! s:lsp_mappings()
  nnoremap <buffer> gd <Plug>(lsp-definition)
  nnoremap <buffer> K <Plug>(lsp-hover)
  nnoremap <buffer> gr <Plug>(lsp-references)
  nnoremap <buffer> <leader>rn <Plug>(lsp-rename)
  nnoremap <buffer> <leader>ca <Plug>(lsp-code-action)
  nnoremap <buffer> <leader>f <Plug>(lsp-formatting)
endfunction

" Enable deoplete for autocompletion
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
\   '_': ['lsp', 'buffer', 'file']
\ })

inoremap <expr> <C-Space> deoplete#manual_complete()

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Auto poput for autocompletion
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_sources = ['vsnip']

" Custom commands: like :B
" El commando es :Build
command Build !g++ -Wall -O2 % -o %< && ./%<
" El atajo de teclado es F5:
nnoremap <F5> :!g++ -Wall -O2 % -o %< && ./%<


" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline_detect_modified=1

let g:airline_section_b = 'Someone lover '
let g:airline_section_y=''
