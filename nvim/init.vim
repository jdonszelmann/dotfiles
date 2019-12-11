
" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs', {'branch': 'master'}
Plug 'prettier/vim-prettier', {'branch': 'release/1.x', 'do': 'yarn install'}
Plug 'lambdalisue/suda.vim'
Plug 'crusoexia/vim-monokai'
Plug 'scrooloose/nerdtree'
call plug#end()

set clipboard=unnamedplus

" Plugin specific settings
let g:suda_smart_edit = 1
filetype plugin indent on


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Editor setup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nomodeline

if has('mouse')
    set mouse=a
endif

set path+=**
set wildmenu

set shell=$SHELL
set modeline
set cursorline
set number
syntax enable

set title
set hidden
set showmatch

set hlsearch
set incsearch
set magic
set ignorecase
set smartcase
set nowrap

set listchars=tab:>-,trail:·
set list
set number relativenumber

" Color
colorscheme monokai
set background=dark
highlight Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
highlight Pmenu ctermfg=grey ctermbg=black

" Command aliasses and shortcuts


cnoreabbrev W w
cnoreabbrev X x
cnoreabbrev Q q


nnoremap <tab> >>_          " increase indent with >>
nnoremap <s-tab> <<_        " decrease indent with <<
inoremap <s-tab> <c-d>
vnoremap <Tab> >gv          " tab to increase indent
vnoremap <S-Tab> <gv        " shift tab to decrease indent

nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

map <C-f> :CocList <CR>
map <C-n> :NERDTreeToggle<CR>

" other random stuff

nnoremap <silent> n n:call BlinkNextMatch()<CR>
nnoremap <silent> N N:call BlinkNextMatch()<CR>

function! BlinkNextMatch() abort
  highlight JustMatched ctermfg=white ctermbg=magenta cterm=bold

  let pat = '\c\%#' . @/
  let id = matchadd('JustMatched', pat)
  redraw

  exec 'sleep 150m'
  call matchdelete(id)
  redraw
endfunction

" Auto commands

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespace

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


augroup my_cmdline
    autocmd!
    autocmd CmdlineEnter : setlocal norelativenumber | redraw
    autocmd CmdlineLeave : setlocal relativenumber
augroup END


