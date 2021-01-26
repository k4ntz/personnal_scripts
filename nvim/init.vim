set encoding=utf-8
set number 
syntax enable
set noswapfile
set scrolloff=6
set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

call plug#begin('~/.vim/plugged')


"Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc-python'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'

call plug#end()

"colorscheme gruvbox
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

"let g:airline_theme='gruvbox'

if (has("termguicolors"))
    set termguicolors
endif

"lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
nmap ² :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode=':t'
nmap > :bp<CR>
nmap < :bn<CR>
nmap <C-w> :bd<CR>


" Move lines
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" Coc
" Go to definition
 nmap <silent> gd <Plug>(coc-definition)

" Displaying documentation 
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Smart rename
nmap <leader>rn <Plug>(coc-rename)
